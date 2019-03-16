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
    public partial class ViewIncident : System.Web.UI.Page
    {

        private Customer selectedCustomer;

        private Incident selectedIncident;

        private User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            //no login info
            if (Session["user"] == null) { Response.Redirect("~/Login.aspx"); }
            //get user information
            user = (User)Session["user"];

            if (user.role != "technician") {Response.Redirect("~/Home.aspx"); }

            if (!IsPostBack)
            {
                ddlCustomers.DataBind();
            }

            Clear();

            ddlStatus.Visible = false;
            btnUpdate.Visible = false;

            if (ddlCustomers.SelectedIndex != 0)
            {
                selectedCustomer = GetSelectedCustomer();
                lblCustomerId.Text = selectedCustomer.customer_id;
            }
            else
            {
                lbIncidents.Items.Clear();
            }


        }

        private Customer GetSelectedCustomer()
        {

            //get row from SqlDataSource based on value in drop-down list
            DataView customerTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            customerTable.RowFilter =
                "customer_id = '" + ddlCustomers.SelectedValue + "'";
            DataRowView row = customerTable[0];

            //create a new customer object and load with data from row
            Customer c = new Customer();
            c.customer_id = row["customer_id"].ToString();
            return c;
        }

        private Incident GetSelectedIncident()
        {

            //get row from SqlDataSource based on value in drop-down list
            DataView incidentTable = (DataView)
                SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            incidentTable.RowFilter =
                "incident_id = '" + lbIncidents.SelectedValue + "'";
            DataRowView row = incidentTable[0];

            //create a new customer object and load with data from row
            Incident i = new Incident();
            
            i.description = row["description"].ToString();
            i.incident_number = row["incident_number"].ToString();
            i.status = row["status"].ToString();
            i.datetime = row["datetime"].ToString();
            return i;
        }

        //clears all the data fields
        private void Clear()
        {
            lblDateTime.Text = string.Empty;
            lblIncidentNum.Text = string.Empty;
            lblCustomerId.Text = string.Empty;
            txtDescription.Text = string.Empty;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(lbIncidents.Items.Count > 0 && lbIncidents.SelectedIndex != -1)
            {
                selectedIncident = GetSelectedIncident();
                lblDateTime.Text = selectedIncident.datetime;
                hfStatus.Value = selectedIncident.status;
                lblIncidentNum.Text = selectedIncident.incident_number;
                hfIncidentNumber.Value = selectedIncident.incident_number;
                txtDescription.Text = selectedIncident.description;
                ddlStatus.Visible = true;
                ddlStatus.Enabled = true;
                btnUpdate.Visible = true;

                if (hfStatus.Value == "NEW")
                {
                    ddlStatus.SelectedIndex = 0;
                }
                else if (hfStatus.Value == "IN PROGRESS")
                {
                    ddlStatus.SelectedIndex = 1;
                }
                else
                {
                    ddlStatus.SelectedIndex = 2;
                    ddlStatus.Enabled = false;
                    btnUpdate.Visible = false;
                }
            }
            else
            {
                //shows an alert box when the user tries to retrieve on an empty listbox
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert ('Theres no data to retrieve, please select an incident from the incident list!')", true);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Update();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert ('Successfully updated the status of the incident!!')", true);
        }

        protected void btnHome_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void lkbhead_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}