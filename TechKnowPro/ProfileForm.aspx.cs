using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechKnowPro.Model;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace TechKnowPro
{
    public partial class ProfileForm : System.Web.UI.Page
    {
        Customer selectedCustomer;
        User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            //no login info
            if (Session["user"] == null) { Response.Redirect("~/Login.aspx"); }
            //get user information, redirect if wrong access level
            user = (User)Session["user"];
            if (user.role != "customer") { Response.Redirect("~/Home.aspx"); }

            if (!IsPostBack)
            {
                ddlQuest.DataBind();
                //get customer info
                selectedCustomer = this.GetSelectedCustomer();

                txtFirstN.Text = selectedCustomer.firstname;
                txtLastN.Text = selectedCustomer.lastname;
                txtPhone.Text = selectedCustomer.phone;
                txtAddress.Text = selectedCustomer.address;
                ddlQuest.SelectedIndex = Convert.ToInt32(selectedCustomer.questionId) - 1;
                txtAnswer.Text = selectedCustomer.questionAnswer;
                txtUser.Text = txtEmail.Text = selectedCustomer.email;
                txtPos.Text = selectedCustomer.positionTitle;

                sdsRetPassw.DataBind();
                //set session id to get password
                Session["UsId"] = selectedCustomer.user_id;
                DataView dV = (DataView)sdsRetPassw.Select(DataSourceSelectArguments.Empty);
                DataRowView rV = dV[0]; //retrieve password inside db 
                txtPass.Text = rV["password"].ToString();

            }


        }

        private Customer GetSelectedCustomer()
        {
            //get table and filter to get customer
            DataView customersTable = (DataView)sdsCustomerInformation.Select(DataSourceSelectArguments.Empty);

            customersTable.RowFilter =
                "user_id='" + user.userId + "'";
            DataRowView row = customersTable[0];

            //create customer object and add details to object
            Customer c = new Customer();
            c.customer_id = row["customer_id"].ToString();
            c.user_id = row["user_id"].ToString();
            c.firstname = row["firstname"].ToString();
            c.lastname = row["lastname"].ToString();
            c.fullname = row["fullname"].ToString();
            c.address = row["address"].ToString();
            c.phone = row["phone"].ToString();
            c.email = row["email"].ToString();
            c.positionTitle = row["position_title"].ToString();
            c.questionId = row["question_id"].ToString();
            c.questionAnswer = row["question_answer"].ToString();
            return c;

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //if password is updated
            if (txtPass.Text != null)
            {
                //hash password and add to session variable
                Session["password"] = hashPassword(txtPass.Text);
                //updates the username and password first
                sdsUserPass.Update();
                Session.Remove("password");
            }
            else
            {
                sdsUser.Update();
            }

            //updates customer information
            Session["QId"] = ddlQuest.SelectedIndex + 1; //should be the number of the value selected
            sdsCustomer.Update();

            selectedCustomer = this.GetSelectedCustomer();
            selectedCustomer.questionId = (ddlQuest.SelectedIndex + 1).ToString();


            //Session["Customer"] = selectedCustomer;
            //CustomerManager sampleMan = (CustomerManager)Session["custoList"];
            //sampleMan.update(selectedCustomer);
            //Session["custoList"] = sampleMan;

            //UpdateModal Script
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script language='javascript'>");
            sb.Append(@"$('#updateModal').modal('show');");
            sb.Append(@"</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "JSScript", sb.ToString());

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        public string hashPassword(string password)
        {
            SHA256 sha256 = SHA256Managed.Create();
            byte[] bytes = Encoding.UTF8.GetBytes(password);
            byte[] hash = sha256.ComputeHash(bytes);
            //convert hash to string
            StringBuilder result = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                result.Append(hash[i].ToString("X2"));
            }
            //store hash string to session to update database
            return result.ToString();
        }

        //Modal btn
        protected void btnModal_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ProfileForm.aspx");
        }

        protected void lkbhead_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}