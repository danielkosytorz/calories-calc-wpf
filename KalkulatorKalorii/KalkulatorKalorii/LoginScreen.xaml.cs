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
    /// Logika interakcji dla klasy LoginScreen.xaml
    /// </summary>
    public partial class LoginScreen : Window
    {
        private DataAccess dataAccess;
        public LoginScreen()
        {
            InitializeComponent();
        }

        private void btnSubmit_Click(object sender, RoutedEventArgs e) // tutaj dodac sprawdzanie użytkoników oraz haseł z bazą danych
        {
            dataAccess = new DataAccess();
            string username = txtUsername.Text;
            string passwd = txtPassword.Password;
            UserModel user = dataAccess.LoginUser(username, passwd);

            if(user != null)
            {
                MainWindow dashboard = new MainWindow(user.ToString());
                dashboard.Show();
                this.Close();
            } else
            {
                MessageBox.Show("Username or password is incorrect.");
            }
        }
        private void btnSignUp_Click(object sender, RoutedEventArgs e)
        {
            // tu dodać metodę do dodania użytkownika do bazy
        }
    }
}
