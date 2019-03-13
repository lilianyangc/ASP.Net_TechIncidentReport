using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TechKnowPro.Model;
using System.Security.Cryptography;
using System.Text;
using System.Net.Mail;

namespace TechKnowPro
{
    public partial class Registration : System.Web.UI.Page
    {

        public DataView d1, d2;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                 ddlQuestions.DataBind();
            }
        }

        protected void btnRegis_Click(object sender, EventArgs e)
        {
            d1 = (DataView)sdsUserCheck.Select(DataSourceSelectArguments.Empty);//all from user
            if (d1.Count == 0 && cbAgree.Checked) //check if there is no duplicate values
            {
                hashPassword();
                sdsUser.Insert(); //insert into user value of textbox user and password
                store(); //after user inserted the user_id and rol_ID =1 will be used to store it in user_role table
                sdsRole.Insert(); //insert into user_role
                //after question is available take the id to send to customer table
                sdsCustomers.Insert(); // insert into customers table
                mail();
                //add email to session

                Response.Redirect("~/RegistrationSuccessful.aspx");

            }
            else { lblSuccOrErr.Text = "User exists already/Agreement not checked"; }
        }

        public void hashPassword()
        {
            SHA256 sha256 = SHA256Managed.Create();
            byte[] bytes = Encoding.UTF8.GetBytes(txtPass1.Text);
            byte[] hash = sha256.ComputeHash(bytes);
            //convert hash to string
            StringBuilder result = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                result.Append(hash[i].ToString("X2"));
            }
            //store hash string to session to update database
            Session["password"] = result.ToString();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                txtEm.Text = "";
                txtAddr.Text = "";
                txtFN.Text = "";
                txtLN.Text = "";
                txtPass1.Text = "";
                txtPass2.Text = "";
            }

            Response.Redirect("Login.aspx");
        }


        protected void mail()
        {
            SmtpClient sm = new SmtpClient("smtp.gmail.com", 587);
            sm.Credentials = new System.Net.NetworkCredential(txtEm.Text, txtPass1.Text);
            sm.DeliveryMethod = SmtpDeliveryMethod.Network;

            MailMessage mailMessage = new MailMessage("TechKnowProCompa@gmail.com", txtEm.Text);
            mailMessage.IsBodyHtml = true;
            mailMessage.Subject = "Notification Email(Tech Pro)";
            mailMessage.Body = txtFN.Text + " " + txtLN.Text + " your email has been verify click on the " +
                "link to login page" + " " + String.Format("<a href='{0}/Login.aspx'>Login</a>", HttpContext.Current.Request.Url.Host);
            sm.EnableSsl = true;

            try
            {
                sm.Send(mailMessage);
                lblSuccOrErr.Text = "Registration successful! An email has been sent please check your email";

            }
            catch (Exception ex)
            {
                lblSuccOrErr.Text = ex.ToString();
            }

        }


        public void store()
        {
            d2 = (DataView)sdsUser.Select(DataSourceSelectArguments.Empty);
            d2.RowFilter = "username = '" + txtEm.Text + "' "; //new data row added so we check username
            DataRowView rowV2 = d2[0];

            Session["user_id"] = (int)rowV2["user_id"];
            Session["rol_id"] = 1; //customer role
            Session["email"] = rowV2["username"].ToString();
            Session["firstN"] = txtFN.Text;
            Session["lastN"] = txtLN.Text;
            Session["address"] = txtAddr.Text;
            Session["questionAnswer"] = txtQuestionAnswer.Text;

            //null value for other because first registered user won't have that

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //Modal Script
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script language='javascript'>");
            sb.Append(@"$('#termsModal').modal('show');");
            sb.Append(@"</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "JSScript", sb.ToString());
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration.aspx");
        }
    }
}