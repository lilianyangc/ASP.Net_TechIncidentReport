using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechKnowPro
{
    public class Incident
    {
        public string incident_id { get; set; }
        public string incident_number { get; set; }
        public string datetime { get; set; }
        public string status { get; set; }
        public string description { get; set; }
        public string method_of_contact { get; set; }
        public string product_name { get; set; }
    }
}