using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineLibraryManagement.DAL
{
    public class Connection
    {
        public static string GetConnectionString()
        {
            string conStr = "Data Source=.;Initial Catalog=LibraryManagementDB;Integrated Security=True";
            return conStr;
        }


    }
}