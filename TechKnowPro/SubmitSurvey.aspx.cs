using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechKnowPro.Model;

namespace TechKnowPro
{
    public partial class SubmitSurvey : System.Web.UI.Page
    {
        User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            //no login info
            if (Session["user"] == null) { Response.Redirect("~/Login.aspx"); }
            //get user information, redirect if wrong access level
            user = (User)Session["user"];
            if (user.role != "customer") { Response.Redirect("~/Home.aspx"); }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void btnReturnSurvey_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Survey.aspx");
        }

        protected void lkbhead_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}