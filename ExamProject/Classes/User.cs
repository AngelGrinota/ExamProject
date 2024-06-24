using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamProject.Classes
{
    public class User 
    {
        public string UserLogin { get; set; }
        public string UserPassword { get; set; }
        public int RoleID { get; set; }

        public string UserName { get; set; }
        public string UserPatronymic { get; set; }
        public string UserSurname { get; set; }

    }
}