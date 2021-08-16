using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KalkulatorKalorii
{
    class UserModel
    {
        public int UserID;
        public string Login;
        public string Password;
        public string Email;

        public UserModel(int userID, string login, string password, string email)
        {
            UserID = userID;
            Login = login;
            Password = password;
            Email = email;
        }

        public override string ToString()
        {
            return $"{Login}";
        }
    }
}
