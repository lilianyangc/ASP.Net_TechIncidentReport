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
    public partial class Registration : System.Web.UI.Page
    {
       
        public DataView d1,d2;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnRegis_Click(object sender, EventArgs e)
        {
             d1 = (DataView)sdsUserCheck.Select(DataSourceSelectArguments.Empty);//all from user
            if (d1.Count==0 && cbAgree.Checked) //check if there is no duplicate values
            {
               sdsUser.Insert(); //insert into user value of textbox user and password
               store(); //after user inserted the user_id and rol_ID =3 will be used to store it in user_role table
               sdsRole.Insert(); //insert into user_role
                //after question is available take the id to send to customer table
                sdsCustomers.Insert(); // insert with value question id =9
                
                lblSuccOrErr.Text = "Registration successful! An email has been sent please check your email";
                Session.Abandon();
                Response.Redirect("~/Login.aspx");
            }
            else { lblSuccOrErr.Text = "User exists already/Agreement not checked"; }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                txtEm.Text = "";
                txtAddr.Text = "";
                txtFN.Text = "";
                txtLN.Text = "";
                txtPass1.Text = "";
                txtPass2.Text = "";
            }

            Response.Redirect("Login.aspx");
        }
        public void store()
        {
            d2= (DataView)sdsUser.Select(DataSourceSelectArguments.Empty);
            d2.RowFilter = "username = '" + txtEm.Text + "' "; //new data row added so we check username
            DataRowView rowV2 = d2[0];

            Session["user_id"] = (int)rowV2["user_id"];
            Session["rol_id"] = 1; //customer role
            Session["email"] = rowV2["username"].ToString(); 
            Session["firstN"] = txtFN.Text;
            Session["lastN"] = txtLN.Text;
            Session["address"] = txtAddr.Text;
            Session["questId"] = 9; // id9 = null
            //null value for other because first registered user won't have that
            
           
          
        }

        
    }
}