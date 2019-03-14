using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using TechKnowPro.Model;

namespace TechKnowPro
{
    public partial class Survey : System.Web.UI.Page
    {
        User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //Session["userId"] = "5";
            //Session["customerId"] = "5"; 

            //no login info
            if (Session["user"] == null) { Response.Redirect("~/Login.aspx"); }
            //get user information, redirect if wrong access level
            user = (User)Session["user"];
            if (user.role != "customer") { Response.Redirect("~/Home.aspx"); }

            txtCustId.Text = Session["customerId"].ToString();

            if (DropDownList1.SelectedIndex == 0)
            {
                btnSubmit.Visible = false;
                RadioButtonList1.Enabled = false;
                RadioButtonList2.Enabled = false;
                RadioButtonList3.Enabled = false;
                RadioButtonList4.Enabled = false;
                txtComments.Enabled = false;


            }
            else
            {
                btnSubmit.Visible = true;
                RadioButtonList1.Enabled = true;
                RadioButtonList2.Enabled = true;
                RadioButtonList3.Enabled = true;
                RadioButtonList4.Enabled = true;
                txtComments.Enabled = true;
            }

        }
      

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            SqlDataSource2.InsertParameters["datetime"].DefaultValue = DateTime.Now.ToString();
            SqlDataSource2.Insert();
            SqlDataSource3.Update();
            Response.Redirect("SubmitSurvey.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void lkbhead_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}