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
            lblSucc.Text = "";

            //if password is updated
            if (txtPass.Text != "")
            {
                //validate password
                PasswordValidator pv = new PasswordValidator(txtPass.Text);
                if (!pv.isValid())
                {
                    lblSucc.Text = "Password must contain at least 1 uppercase and 1 special character";
                    return;
                }

                //password hashing
                Hasher hashP = new Hasher(txtPass.Text);
                Session["password"] = hashP.getHashedPassword();
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

        protected void lkbhead_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}