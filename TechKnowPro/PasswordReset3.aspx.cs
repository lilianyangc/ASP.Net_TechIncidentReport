using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
            //hash password then add to session variable
            Session["password"] = hashPassword(txtPassword1.Text);
            sdsPassword.Update();
            //disable buttons and form
            txtPassword1.Enabled = false;
            txtPassword2.Enabled = false;
            btnSubmit.Enabled = false;
            //update message and clear session
            lblMsg.Text = "Password has been successfuly updated! <a href=\"Login.aspx\">Back to Login</a>";
            Session.Clear();
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
    }
}