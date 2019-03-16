using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechKnowPro.Model;

namespace TechKnowPro
{
    public partial class PasswordReset3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            //redirect if accessed illegaly
            if (Session["userId"] == null) { Response.Redirect("~/Login.aspx"); }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblErr.Text = "";
            //validate password
            PasswordValidator pv = new PasswordValidator(txtPassword1.Text);
            if (!pv.isValid())
            {
                lblErr.Text = "Password is missing at least 1 uppercase<br/> and 1 special character";
                return;
            }

            //password hashing
            Hasher hashP = new Hasher(txtPassword1.Text);
            Session["password"] = hashP.getHashedPassword();
            sdsPassword.Update();
            //disable buttons and form
            txtPassword1.Enabled = false;
            txtPassword2.Enabled = false;
            btnSubmit.Enabled = false;
            //update message and clear session
            lblMsg.Text = "Password has been successfuly updated! <a href=\"Login.aspx\">Back to Login</a>";
            Session.Clear();
        }

        protected void lkbhead_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }
    }
}