using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TechKnowPro.Model;
using System.Data.SqlClient;


namespace TechKnowPro
{
    public partial class ViewSurvey : System.Web.UI.Page
    {
        private Customer selectedCustomer;

        private Survey selectedSurvey;

        User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            //no login info
            if (Session["user"] == null) { Response.Redirect("~/Login.aspx"); }
            //get user information, redirect if wrong access level
            user = (User)Session["user"];
            if (user.role != "admin") { Response.Redirect("~/Home.aspx"); }


            if (!IsPostBack)
            {
                DropDownList1.DataBind();
                TextBox1.Text = "";

            }
            else {
                TextBox1.Text = DropDownList1.SelectedValue;
            }

            Clear();

        }

        private Customer GetSelectedCustomer()
        {

            DataView customerTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            customerTable.RowFilter =
                "customer_id = '" + DropDownList1.SelectedValue + "'";
            DataRowView row = customerTable[0];

          
            Customer c = new Customer();
            
            c.customer_id = row["customer_id"].ToString();
            
            return c;
        }

        private Survey GetSelectedSurvey()
        {
  
            DataView surveyTable = (DataView)
                SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            surveyTable.RowFilter =
                "survey_id = '" + lbSurvey.SelectedValue + "'";
            DataRowView row = surveyTable[0];     
            Survey i = new Survey();

            lblResponseTime.Text= row["response_time"].ToString();
            lblTechEfficiency.Text = row["technician_efficiency"].ToString();
            lblProbReso.Text = row["problem_efficiency"].ToString();
            lblContactToDiscuss.Text = row["contact_to_discuss"].ToString();
            lblPreferredContactMethod.Text = row["preferred_contact"].ToString();
            txtAdditionalComments.Text = row["additional_comment"].ToString();
            return i;
        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            if (lbSurvey.Items.Count > 0 && lbSurvey.SelectedIndex != -1) {
                selectedSurvey = GetSelectedSurvey();
                
            }
              
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

        private void Clear()
        {
            
            lblResponseTime.Text = " ";
            lblTechEfficiency.Text = " ";
            lblProbReso.Text = " ";
            lblContactToDiscuss.Text = " ";
            lblPreferredContactMethod.Text = " ";
            txtAdditionalComments.Text = " ";
            
            lblNoSurvey.Text = "";
        }


        protected void lkb_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}