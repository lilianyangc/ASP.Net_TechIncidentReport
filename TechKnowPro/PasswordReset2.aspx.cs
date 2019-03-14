using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class PasswordReset2 : System.Web.UI.Page
    {
        DataView custTable;
        DataRowView row;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //redirect if accessed illegaly
            if (Session["emailReset"]==null) { Response.Redirect("~/Login.aspx"); }

            //get security question information from table
            custTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            //store email from session to variable
            string email = Session["emailReset"].ToString();
            //filter table and  create DataRowView variable
            custTable.RowFilter = "email = '" + email + "' ";
            row = custTable[0];
            //show the question
            lblQuestion.Text = row["description"].ToString();
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtAnswer.Text == row["question_answer"].ToString())
            {
                Session["userId"] = row["user_id"];
                Response.Redirect("~/PasswordReset3.aspx");
            }
            //if incorrect answer
            lblError.Text = "Incorrect answer to security question!";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void lkbhead_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }
    }
}