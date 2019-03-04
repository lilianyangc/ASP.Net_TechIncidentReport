using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class ViewSurvey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            if (this.IsValid) {
                DataView surveyView = (DataView)
              SqlDataSource3.Select(DataSourceSelectArguments.Empty);

                DataRowView row = surveyView[0];

                lblResponseTime.Text = row["response_time"].ToString();
                lblTechEfficiency.Text = row["technician_efficiency"].ToString();
                lblProbReso.Text = row["problem_efficiency"].ToString();
                lblContactToDiscuss.Text = row["contact_to_discuss"].ToString();
                lblPreferredContactMethod.Text = row["preferred_contact"].ToString();
                txtAdditionalComments.Text = row["additional_comment"].ToString();
            }
          

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }
    }
}