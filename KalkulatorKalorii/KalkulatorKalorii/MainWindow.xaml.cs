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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace KalkulatorKalorii
{
    /// <summary>
    /// Logika interakcji dla klasy MainWindow.xaml
    /// </summary>

    public partial class MainWindow : Window
    {
        private DataAccess dataAccess;
        private string LoggedUser;
        public string TodayDate;
        public MainWindow(string user)
        {
            InitializeComponent();
            LoggedUser = user;
            TextBlockLoggedUser.Text = LoggedUser;
            TodayDate = DateTime.Now.ToString("yyyy-MM-dd");
            TextBlockDate.Text = TodayDate;
            FillListBoxesWithFood();
            FillListBoxesWithExercises();
            CountCaloriesAndMacros();
            CountBurnedCalories();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var questionToLogout = MessageBox.Show($"Do you want to log out?", "Alert", MessageBoxButton.YesNo);
            if (questionToLogout == MessageBoxResult.Yes)
            {
                LoginScreen loginScreen = new LoginScreen();
                loginScreen.Show();
                this.Close();
            }
        }
        public void FillListBoxesWithFood()
        {
            dataAccess = new DataAccess();
            ListBoxBreakfast.ItemsSource = dataAccess.GetFoodFromSpecificTime("Breakfast", TodayDate, LoggedUser);
            ListBoxDinner.ItemsSource = dataAccess.GetFoodFromSpecificTime("Dinner", TodayDate, LoggedUser);
            ListBoxSupper.ItemsSource = dataAccess.GetFoodFromSpecificTime("Supper", TodayDate, LoggedUser);
        }
        public void FillListBoxesWithExercises()
        {
            dataAccess = new DataAccess();
            ListBoxExercises.ItemsSource = dataAccess.GetExercisesFromUserAndDate(LoggedUser, TodayDate);
        }
        private void AddFood(object sender, RoutedEventArgs e)
        {
            Food addFood = new Food(LoggedUser);
            addFood.Show();
            this.Close();
        }

        private void AddExercise(object sender, RoutedEventArgs e)
        {
            Exercises addExe = new Exercises(LoggedUser);
            addExe.Show();
            this.Close();
        }

        private void DeleteFood(object sender, RoutedEventArgs e)
        {
            dataAccess = new DataAccess();
            FoodModel breakfast_food_to_delete = (FoodModel)ListBoxBreakfast.SelectedItem;
            FoodModel dinner_food_to_delete = (FoodModel)ListBoxDinner.SelectedItem;
            FoodModel supper_food_to_delete = (FoodModel)ListBoxSupper.SelectedItem;
            if(breakfast_food_to_delete != null)
            {
                dataAccess.DeleteFood(LoggedUser, breakfast_food_to_delete.Name,  "Breakfast", TodayDate);
            }
            if (dinner_food_to_delete != null)
            {
                dataAccess.DeleteFood(LoggedUser, dinner_food_to_delete.Name, "Dinner", TodayDate);
            }
            if(supper_food_to_delete != null)
            {
                dataAccess.DeleteFood(LoggedUser, supper_food_to_delete.Name, "Supper", TodayDate);
            }
            FillListBoxesWithFood();
            CountCaloriesAndMacros();
        }
        private void DeleteExercise(object sender, RoutedEventArgs e)
        {
            dataAccess = new DataAccess();
            ExerciseModel exercise_to_delete = (ExerciseModel)ListBoxExercises.SelectedItem;
            if(exercise_to_delete != null)
                dataAccess.DeleteExercise(LoggedUser, exercise_to_delete.Name, TodayDate);
            FillListBoxesWithExercises();
            CountBurnedCalories();
        }
        public void CountCaloriesAndMacros()
        {
            decimal calories = 0;
            decimal proteins = 0;
            decimal carbo = 0;
            decimal fat = 0;
            List<FoodModel> breakfast_food = new List<FoodModel>();
            List<FoodModel> dinner_food = new List<FoodModel>();
            List<FoodModel> supper_food = new List<FoodModel>();
            foreach (var item in ListBoxBreakfast.Items)
                breakfast_food.Add((FoodModel)item);
            foreach (var item in ListBoxDinner.Items)
                dinner_food.Add((FoodModel)item);
            foreach (var item in ListBoxSupper.Items)
                supper_food.Add((FoodModel)item);

            foreach (var item in breakfast_food)
            {
                calories += item.Calories;
                proteins += item.Protein;
                carbo += item.Carbohydrates;
                fat += item.Fat;
            }
            foreach (var item in dinner_food)
            {
                calories += item.Calories;
                proteins += item.Protein;
                carbo += item.Carbohydrates;
                fat += item.Fat;
            }
            foreach (var item in supper_food)
            {
                calories += item.Calories;
                proteins += item.Protein;
                carbo += item.Carbohydrates;
                fat += item.Fat;
            }

            TextBlockCaloriesSummary.Text = calories.ToString();
            TextBlockProteinSummary.Text = proteins.ToString();
            TextBlockCarbohydratesSummary.Text = carbo.ToString();
            TextBlockFatSummary.Text = fat.ToString();
        }
        public void CountBurnedCalories()
        {
            int calories_burned = 0;
            List<ExerciseModel> exercises = new List<ExerciseModel>();
            foreach (var item in ListBoxExercises.Items)
                exercises.Add((ExerciseModel)item);
            foreach (var item in exercises)
                calories_burned += item.CaloriesBurned;

            TextBlockCaloriesBurnedSummary.Text = calories_burned.ToString();
        }
    }
}
