using System;
using System.Collections.Generic;
using System.Diagnostics;
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
    /// Logika interakcji dla klasy Food.xaml
    /// </summary>
    public partial class Food : Window
    {
        private DataAccess dataAccess;
        private string LoggedUser;
        public string TodayDate;
        public Food(string user, string today_date)
        {
            InitializeComponent();
            LoggedUser = user;
            TodayDate = today_date;
            ShowFoodInListBox();
        }
        public void ShowFoodInListBox()
        {
            dataAccess = new DataAccess();
            List<FoodModel> all_food = dataAccess.GetAllFood();
            ListBoxFood.ItemsSource = all_food;
        }
        public string CheckRadioButtonFoodTime()
        {
            string foodTimeOption;
            if (RadioButtonBreakfast.IsChecked == true)
            {
                foodTimeOption = "Breakfast";
                return foodTimeOption;
            }else if(RadioButtonDinner.IsChecked == true)
            {
                foodTimeOption = "Dinner";
                return foodTimeOption;
            }
            else if(RadioButtonSupper.IsChecked == true)
            {
                foodTimeOption = "Supper";
                return foodTimeOption;
            }
            else
            {
                foodTimeOption = "None";
                return foodTimeOption;
            }
        }
        private void btnSubmit_Food(object sender, RoutedEventArgs e)
        {
            //tutaj dodać, że z listy jedzenia, wybrany produkt jest przekazywane dalej czy cos w tym stylu, żeby dodało go do bazy danych
            dataAccess = new DataAccess();
            var questionFood = MessageBox.Show($"Are u sure?", "Alert", MessageBoxButton.YesNo);
            FoodModel selectedFood = (FoodModel)ListBoxFood.SelectedItem;
            string foodTimeOption = CheckRadioButtonFoodTime();
            if (selectedFood != null)
            {
                if (foodTimeOption == "None")
                {
                    MessageBox.Show("You didn't pick any option for time of your food.");
                    MainWindow dashboard = new MainWindow(LoggedUser, TodayDate);
                    dashboard.Show();
                    this.Close();
                }
                else
                {
                    if (questionFood == MessageBoxResult.Yes)
                    {
                        dataAccess.AddFoodToSpecificFoodTime(selectedFood.Name, foodTimeOption, LoggedUser, TodayDate);
                        MainWindow dashboard = new MainWindow(LoggedUser, TodayDate);
                        dashboard.Show();
                        this.Close();
                    }
                }
            }
            else
            {
                MessageBox.Show("You didn't pick any food.");
                MainWindow dashboard = new MainWindow(LoggedUser, TodayDate);
                dashboard.Show();
                this.Close();
            }
        }
    }
}
