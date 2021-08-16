using KalkulatorKalorii.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace KalkulatorKalorii
{
    /// <summary>
    /// Interaction logic for UserProfile.xaml
    /// </summary>
    public partial class UserProfile : Window
    {
        private DataAccess dataAccess;
        private string LoggedUser;
        public string TodayDate;
        public UserProfile(string user, string today_date)
        {
            InitializeComponent();
            LoggedUser = user;
            TodayDate = today_date;
            FillUserProfileData();
        }
        public void BtnReturnMenuProfile(object sender, RoutedEventArgs e)
        {
            MainWindow dashboard = new MainWindow(LoggedUser, TodayDate);
            dashboard.Show();
            this.Close();
        }
        public void btnUpdateUserProfile(object sender, RoutedEventArgs e)
        {
            dataAccess = new DataAccess();
            string first_name = TextBoxFirstName.Text;
            string last_name = TextBoxLastName.Text;
            string gender = TextBoxGender.Text;
            string city = TextBoxCity.Text;
            string address = TextBoxAddress.Text;
            string phone = TextBoxPhone.Text;

            dataAccess.UpdateUserProfileRow(LoggedUser, first_name, last_name, gender, city, address, phone);
            FillUserProfileData();
        }
        public void FillUserProfileData()
        {
            dataAccess = new DataAccess();
            UserProfileModel user_profile_data = dataAccess.GetUserProfileData(LoggedUser);
            TextBoxFirstName.Text = user_profile_data.FirstName;
            TextBoxLastName.Text = user_profile_data.LastName;
            TextBoxGender.Text = user_profile_data.Gender;
            TextBoxCity.Text = user_profile_data.City;
            TextBoxAddress.Text = user_profile_data.Address;
            TextBoxPhone.Text = user_profile_data.Phone;
        }
    }
}
