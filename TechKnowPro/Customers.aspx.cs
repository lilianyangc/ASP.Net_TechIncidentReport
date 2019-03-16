using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TechKnowPro.Model;

namespace TechKnowPro
{
    public partial class Customers : System.Web.UI.Page
    {
        private Customer selectedCustomer;
        User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            //no login info
            if (Session["user"] == null) { Response.Redirect("~/Login.aspx"); }
            //get user information, redirect if wrong access level
            user = (User)Session["user"];
            if (user.role != "admin" && user.role != "technician") { Response.Redirect("~/Home.aspx"); }

            if (!IsPostBack) ddlSelectCustomer.DataBind();

            if (ddlSelectCustomer.SelectedIndex != 0)
            {
                selectedCustomer = this.GetSelectedCustomer();
                hfCustId.Value = (string)selectedCustomer.customer_id;
                lblAddress.Text = selectedCustomer.address;
                lblPhone.Text = selectedCustomer.phone;
                lblEmail.Text = selectedCustomer.email;
                hfDescription.Value = selectedCustomer.description;
                lblSuccess.Text = "";
            }
        }

        private Customer GetSelectedCustomer()
        {
            //ddlSelectCustomer.Items.Insert(0, new ListItem("Select a store", ""));

            DataView customersTable = (DataView)
               SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            customersTable.RowFilter =
                "customer_id='" + ddlSelectCustomer.SelectedValue + "'";
            DataRowView row = customersTable[0];

            Customer c = new Customer();
            c.customer_id = row["customer_id"].ToString();
            c.fullname = row["fullname"].ToString();
            c.address = row["address"].ToString();
            c.phone = row["phone"].ToString();
            c.email = row["email"].ToString();
            c.description = row["fullname"].ToString() +"; " + row["phone"].ToString()+"; " + row["email"].ToString();
            return c;
        }

        protected void btnDisplayContactList_Click(object sender, EventArgs e)
        {
            Server.Transfer("Contactlist.aspx");
        }

        protected void btnAddContactList_Click(object sender, EventArgs e)
        {

            if (IsValid && selectedCustomer != null)
            {
                SqlDataSource1.Insert();
                lblSuccess.Text = "Successfully added to contactlist.";
            }
            else
            {
                lblSuccess.Text = "Failed to add in contactlist.";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void lkb_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx");
        }
    }
    }
