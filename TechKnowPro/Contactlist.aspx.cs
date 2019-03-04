using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TechKnowPro
{
    public partial class Contactlist : System.Web.UI.Page
    {
        //private int selectedContact;
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack) lbContacts.DataBind();

           //hfSelectedContact.Value = this.lbContacts.SelectedValue.ToString();

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
    }
}