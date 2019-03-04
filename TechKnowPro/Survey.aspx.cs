using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace TechKnowPro
{
    public partial class Survey : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;           
            //Session["userId"] = "5";
            //Session["customerId"] = "5"; 
            txtCustId.Text = Session["customerId"].ToString();
            
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
    }
}