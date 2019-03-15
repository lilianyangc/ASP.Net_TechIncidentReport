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
    public partial class Contactlist : System.Web.UI.Page
    {
        User user;

        //private int selectedContact;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) lbContacts.DataBind();

            //no login info
            if (Session["user"] == null) { Response.Redirect("~/Login.aspx"); }
            //get user information, redirect if wrong access level
            user = (User)Session["user"];
            if (user.role != "admin" && user.role != "technician") { Response.Redirect("~/Home.aspx"); }

        }

        protected void btnSelectAddCust_Click(object sender, EventArgs e)
        {
            Server.Transfer("Customers.aspx");
        }

        protected void btnRemoveContact_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Delete();
            lbContacts.DataBind();
        }

        protected void btnEmptyList_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Delete();
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