using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KalkulatorKalorii.Model
{
    class UserBodyModel
    {
        public int UserBodyID;
        public int UserID;
        public string Weight;
        public string Height;
        public string Bodyfat;
        public string BMI;

        public UserBodyModel()
        {
        }

        public UserBodyModel(int user_body_id, int user_id, string weight, string height, string bodyfat, string bmi)
        {
            UserBodyID = user_body_id;
            UserID = user_id;
            Weight = weight;
            Height = height;
            Bodyfat = bodyfat;
            BMI = bmi;
        }
    }
}
