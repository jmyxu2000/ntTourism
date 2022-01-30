using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class AdminInfo
    {
        private string userid;

        public string Userid
        {
            get { return userid; }
            set { userid = value; }
        }

        private string account;

        public string Account
        {
            get { return account; }
            set { account = value; }
        }

        private string password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
    }
}
