using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class RegistrationSuccessful : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            string email = Session["email"].ToString();
            lblMessage.Text = "An email has been sent to " + email + ". Please check your email to verify and confirm.";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Server.Transfer("Login.aspx");
        }
    }
}