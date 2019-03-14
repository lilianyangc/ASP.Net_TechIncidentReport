using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class PasswordReset1 : System.Web.UI.Page
    {
        DataView emailTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //generate login table which includes user_id, username(email), password and role(acces level)
            emailTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            emailTable.Sort = "email";
            int i = emailTable.Find(txtEmail.Text);
            if (i == -1)
            {
                lblError.Text = "Email address cannot be found!";
            }
            else
            {
                Session["emailReset"] = txtEmail.Text;
                Response.Redirect("~/PasswordReset2.aspx");
            }
        }

        protected void lkbhead_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }
    }
}