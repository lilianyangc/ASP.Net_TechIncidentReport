using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechKnowPro.Model
{
    public class Survey
    {
        public string incident_id { get; set; }
        public string response_time { get; set; }
        public string technician_efficiency { get; set; }
        public string problem_efficiency { get; set; }
        public string contact_to_discuss { get; set; }
        public string prefered_contact { get; set; }
        public string additional_comment { get; set; }
        public string datetime { get; set; }

    }
}