/* COMP 2139 Assignment 1
 Project Name: TeckKnowPro - Tech Incident Management Web App
 Date of Submission: March 15, 2019
 Prof.: Sergio Santilli

 System coded by:
 Team: Fork-night
 Members:
            1. Aldrin Jacildo - 101112293
            2. Francis Victa - 101159185
            3. Maria Lilian Yang - 101151657
            4. Sir Angel Naguit - 101152749
            5. Orell Steven Wemin - 101091788

 Project tools:
 IDE: Microsoft Visual Studio Ver. 2017
      -ASP.NET with SQL Server
 others: Github, Draw.io
 */
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechKnowPro.Model;
using System.Security.Cryptography;
using System.Text;

namespace TechKnowPro
{
    public partial class Login : System.Web.UI.Page
    {
        DataView loginTable;

       

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //generate login table which includes user_id, username(email), password and role(acces level)
            loginTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            loginTable.Sort = "username";
            int i = loginTable.Find(txtUsername.Text);
            if (i == -1)
            {
                lblResult.Text = "Username does not exist!";
            }
            else
            {
                //hash entered password in login form then compare to hash in database
                string hash = hashPassword(txtPassword.Text);

                if (loginTable[i]["password"].ToString() == hash)
                {
                    //if password correct, store information in a User class
                    User user = new User();
                    user.userId = loginTable[i]["user_id"].ToString();
                    user.username = loginTable[i]["username"].ToString();
                    user.role = loginTable[i]["definition"].ToString();
                    Session["user"] = user;

                    Response.Redirect("~/Home.aspx");

                }
                else
                {
                    lblResult.Text = "You have entered an incorrect password!";
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration.aspx");
        }

        public string hashPassword(string password)
        {
            SHA256 sha256 = SHA256Managed.Create();
            byte[] bytes = Encoding.UTF8.GetBytes(password);
            byte[] hash = sha256.ComputeHash(bytes);
            //convert hash to string
            StringBuilder result = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                result.Append(hash[i].ToString("X2"));
            }
            //store hash string to session to update database
            return result.ToString();
        }


    }
}