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
    /// Logika interakcji dla klasy Exercises.xaml
    /// </summary>
    public partial class Exercises : Window
    {
        private DataAccess dataAccess;
        private string LoggedUser;
        public string TodayDate;
        public Exercises(string user)
        {
            InitializeComponent();
            LoggedUser = user;
            TodayDate = DateTime.Now.ToString("yyyy-MM-dd");
            ShowExercisesInListbox();
        }
        public void ShowExercisesInListbox()
        {
            dataAccess = new DataAccess();
            List<ExerciseModel> all_exercises = dataAccess.GetAllExercises();
            ListBoxExercises.ItemsSource = all_exercises;
        }
        private void btnSubmit_Exercise(object sender, RoutedEventArgs e)
        {
            dataAccess = new DataAccess();
            var questionFood = MessageBox.Show($"Are u sure?", "Alert", MessageBoxButton.YesNo);
            ExerciseModel selectedExercise = (ExerciseModel)ListBoxExercises.SelectedItem;
            if(selectedExercise != null)
            {
                if (questionFood == MessageBoxResult.Yes)
                {
                    dataAccess.AddExerciseToExerciseDay(selectedExercise.Name, LoggedUser, TodayDate);
                    MainWindow dashboard = new MainWindow(LoggedUser);
                    dashboard.Show();
                    this.Close();
                }
            }
            else
            {
                MessageBox.Show("You didn't pick any exercise.");
                MainWindow dashboard = new MainWindow(LoggedUser);
                dashboard.Show();
                this.Close();
            }
            
        }

    }
}
