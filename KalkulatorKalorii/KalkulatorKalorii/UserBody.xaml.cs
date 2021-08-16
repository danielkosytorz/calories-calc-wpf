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
    /// Interaction logic for UserBody.xaml
    /// </summary>
    public partial class UserBody : Window
    {
        private DataAccess dataAccess;
        private string LoggedUser;
        public string TodayDate;
        public UserBody(string user, string today_date)
        {
            InitializeComponent();
            LoggedUser = user;
            TodayDate = today_date;
            FillUserBodyData();
        }
        public void btnReturnMenuBody(object sender, RoutedEventArgs e)
        {
            MainWindow dashboard = new MainWindow(LoggedUser, TodayDate);
            dashboard.Show();
            this.Close();
        }
        public void btnUpdateUserBody(object sender, RoutedEventArgs e)
        {
            dataAccess = new DataAccess();
            string weight = TextBoxWeight.Text;
            string height = TextBoxHeight.Text;
            string bodyfat = TextBoxBodyfat.Text;
            string bmi = TextBoxBmi.Text;

            dataAccess.UpdateUserBodyRow(LoggedUser, weight, height, bodyfat, bmi);
            FillUserBodyData();
        }
        public void FillUserBodyData()
        {
            dataAccess = new DataAccess();
            UserBodyModel user_body_data = dataAccess.GetUserBodyData(LoggedUser);
            TextBoxWeight.Text = user_body_data.Weight;
            TextBoxHeight.Text = user_body_data.Height;
            TextBoxBodyfat.Text = user_body_data.Bodyfat;
            TextBoxBmi.Text = user_body_data.BMI;
        }
    }
}
