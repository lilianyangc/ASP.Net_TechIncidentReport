using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class PasswordReset3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            sdsPassword.Update();
            //disable buttons and form
            txtPassword1.Enabled = false;
            txtPassword2.Enabled = false;
            btnSubmit.Enabled = false;
            //update message and clear session
            lblMsg.Text = "Password has been successfuly updated! <a href=\"Login.aspx\">Back to Login</a>";
            Session.Clear();
        }
    }
}