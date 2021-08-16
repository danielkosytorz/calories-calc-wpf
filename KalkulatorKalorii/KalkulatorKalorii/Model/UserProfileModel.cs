using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KalkulatorKalorii.Model
{
    class UserProfileModel
    {
        public int UserProfileID;
        public int UserID;
        public string FirstName;
        public string LastName;
        public string Gender;
        public string City;
        public string Address;
        public string Phone;

        public UserProfileModel()
        {
        }

        public UserProfileModel(int user_profile_id, int user_id, string first_name, string last_name, string gender, string city, string address, string phone)
        {
            UserProfileID = user_profile_id;
            UserID = user_id;
            FirstName = first_name;
            LastName = last_name;
            Gender = gender;
            City = city;
            Address = address;
            Phone = phone;
        }

    }
}
