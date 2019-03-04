using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechKnowPro.Model
{
    public class CustomerManager
    {
        public  List<Customer> customerList;
        
        
        public CustomerManager()
        {
           
            customerList = new List<Customer>();
        }
        public void add(Customer a)
        { customerList.Add(a);
        }

        public void update(Customer a)
        {  
           int index = customerList.FindIndex(x => x.firstname == a.lastname);
            customerList.RemoveAt(index);
            customerList.Insert(index, a);
           
            
        }

        public int count()
        {
            return customerList.Count();
        }
        public void Remove(int index)
        {
            customerList.RemoveAt(index);
        }

        public void DeleteAll()
        {
            customerList.Clear();
        }

    }

    
}