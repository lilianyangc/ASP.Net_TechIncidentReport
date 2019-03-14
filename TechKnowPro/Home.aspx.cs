using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechKnowPro.Model;
using System.Data;

namespace TechKnowPro
{
    public partial class Home : System.Web.UI.Page
    {
        User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            //no login info
            if (Session["user"] == null) { Response.Redirect("~/Login.aspx"); }
            //get user information
            user = (User)Session["user"];

            lblContent1.Text = "";
            lblContent2.Text = "";

            //pass the user Id to the hidden field
            hfUserID.Value = user.userId;

            //load details for admin
            if (user.role == "admin")
            {
                lblGetStarted.Text = "Go to <a href =\"Customers.aspx\">Customers</a> section to search customer information";
                btnTarget3.Text = "View Surveys";
                
            }
            //load details for technician
            if (user.role == "technician")
            {
                lblGetStarted.Text = "Go to <a href =\"\">Incidents</a> to serch and review client incident reports";
                btnTarget3.Text = "Create Incident";
                btnTarget4.Visible = true;
            }
            //load details for customer
            if (user.role == "customer")
            {
                lblGetStarted.Text = "Go to <a href =\"ProfileForm.aspx\">Profile</a> to update your profile and/or customer information";
                lblContent1.Text = "What do you think about our service?";
                lblContent2.Text = "<a href =\"\">Submit a survey</a> to provide your feedback for any support we have provided to you recently";
                btnTarget.Text = "My Profile";
                btnTarget2.Text = "Surveys";
                btnTarget3.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void btnTarget_Click(object sender, EventArgs e)
        {
            if (user.role == "admin" || user.role == "technician" )
            {
                Server.Transfer("Customers.aspx");
            }

            if (user.role == "customer")
            {
                Server.Transfer("ProfileForm.aspx");
            }

        }

        protected void btnTarget2_Click(object sender, EventArgs e)
        {
           
            if (user.role == "admin" || user.role == "technician")
            {
                Server.Transfer("Contactlist.aspx");
            }
            if (user.role == "customer")
            {
                GetCustomerID();
                Server.Transfer("Survey.aspx");
            }
        }

        protected void btnTarget3_Click(object sender, EventArgs e)
        {
            if (user.role == "admin")
            {
                Server.Transfer("ViewSurvey.aspx");
            }

            if (user.role == "technician")
            {
                Server.Transfer("CreateIncident.aspx");
            }
        }

        protected void btnTarget4_Click(object sender, EventArgs e)
        {
            Server.Transfer("ViewIncident.aspx");
        }

        private void GetCustomerID()
        {

            DataView customer = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            DataRowView row = customer[0];

            Session["customerId"] = row["customer_id"].ToString();
        }

        protected void lkb_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}