using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoApplication.Models
{
    public class Customer
    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string ContactNumber { get; set; }
        public DateTime DOB { get; set; }
        public string DOBString { get; set; }
        public long TurnOver { get; set; }
        public int CityID { get; set; }
        public string City { get; set; }
    }
}