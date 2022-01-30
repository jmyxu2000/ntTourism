using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class UserInfo
    {
        private string usercode;

        public string Usercode
        {
            get { return usercode; }
            set { usercode = value; }
        }
        private string loginname;

        public string Loginname
        {
            get { return loginname; }
            set { loginname = value; }
        }
        private string password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private string firstname;

        public string Firstname
        {
            get { return firstname; }
            set { firstname = value; }
        }
        private string middlename;

        public string Middlename
        {
            get { return middlename; }
            set { middlename = value; }
        }
        private string surname;

        public string Surname
        {
            get { return surname; }
            set { surname = value; }
        }
        private string phone;

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private string title;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }

    }
}
