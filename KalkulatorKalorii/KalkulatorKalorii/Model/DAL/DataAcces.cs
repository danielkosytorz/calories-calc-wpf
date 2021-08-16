using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using System.Windows;
using KalkulatorKalorii.Model;
using System.Globalization;

namespace KalkulatorKalorii
{
    class DataAccess
    {
        MySqlConnectionStringBuilder connStrBuilder;
        MySqlConnection connection;

        public static string ALL_FOOD_QUERY = "SELECT * FROM food";
        public static string ALL_EXERCISES_QUERY = "SELECT * FROM exercises";
        private UserModel user;

        public DataAccess()
        {
            //tworzymy connectionString
            connStrBuilder = new MySqlConnectionStringBuilder();
            //w przykładzie testowym dane zapisane w kodzie w kolejnym projekcie zapiszemy w zasonach aplikacji
            connStrBuilder.UserID = "root";
            connStrBuilder.Password = "";
            connStrBuilder.Server = "localhost";
            connStrBuilder.Database = "new_fitapp";
            connStrBuilder.Port = 3306;

            //connection = new MySqlConnection(connStrBuilder.ToString());
        }

        public List<FoodModel> GetAllFood()
        {
            List<FoodModel> all_food = new List<FoodModel>();
            //connection powiązane będzie z bazą danych tylko w zakresie sekcji unsing i obiekt zostanie automatycznie usunięty poza tym zakresem
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(ALL_FOOD_QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        all_food.Add(new FoodModel((int)dataReader["FoodID"], dataReader["Name"].ToString(), (decimal)dataReader["Calories"], 
                            (decimal)dataReader["Protein"], (decimal)dataReader["Carbohydrates"], (decimal)dataReader["Fat"]));
                    }
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();

            }
            return all_food;//.ToArray();

        }

        public List<ExerciseModel> GetAllExercises()
        {
            List<ExerciseModel> all_exercises = new List<ExerciseModel>();
            //connection powiązane będzie z bazą danych tylko w zakresie sekcji unsing i obiekt zostanie automatycznie usunięty poza tym zakresem
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(ALL_EXERCISES_QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        all_exercises.Add(new ExerciseModel((int)dataReader["ExerciseID"], dataReader["Name"].ToString(), (int)dataReader["CaloriesBurned"]));
                    }
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();

            }
            return all_exercises;//.ToArray();

        }

        public UserModel LoginUser(string login, string password)
        {
            string LOGIN_QUERY = $"SELECT * FROM users WHERE '{login}' LIKE Login AND '{password}' LIKE Password";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(LOGIN_QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while(dataReader.Read())
                        user = new UserModel((int)dataReader["UserID"], dataReader["Login"].ToString(), dataReader["Password"].ToString(), dataReader["E-mail"].ToString());
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();

            }
            return user;
        }
        public int GetUserIdFromLogin(string login)
        {
            string QUERY = $"SELECT UserID FROM users WHERE Login like '{login}';";
            int user_id = -1;
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                        user_id = (int)dataReader["UserID"];
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();

            }
            return user_id;
        }
        public List<ExerciseModel> GetExercisesFromUserAndDate(string logged_user, string today_date)
        {
            List<ExerciseModel> all_exercises_from_date = new List<ExerciseModel>();
            int user_id = GetUserIdFromLogin(logged_user);
            string QUERY = $"SELECT exercises.ExerciseID, exercises.Name, exercises.CaloriesBurned FROM `userexercises` INNER JOIN userexercisestoexercise ON userexercises.UserExercisesID = userexercisestoexercise.UserExercisesID INNER JOIN exercises ON userexercisestoexercise.ExerciseID = exercises.ExerciseID WHERE userexercises.Date = DATE '{today_date}' AND userexercises.UserID = {user_id}; ";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                        all_exercises_from_date.Add(new ExerciseModel((int)dataReader["ExerciseID"], dataReader["Name"].ToString(), (int)dataReader["CaloriesBurned"]));
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();

            }
            return all_exercises_from_date;
        }
        public List<FoodModel> GetFoodFromSpecificTime(string food_time, string today_date, string logged_user)
        {
            List<FoodModel> all_specific_food = new List<FoodModel>();
            int user_id = GetUserIdFromLogin(logged_user);
            string QUERY = "";
            string QUERY_BREAKFAST = $"SELECT breakfast_to_food.FoodID, food.Name, food.Calories, food.Protein, food.Carbohydrates, food.Fat FROM `userfood` INNER JOIN breakfast_to_food ON userfood.UserFoodID = breakfast_to_food.UserBreakfastID INNER JOIN food ON breakfast_to_food.FoodID = food.FoodID WHERE userfood.Date = DATE '{today_date}' AND userfood.UserID = {user_id}; ";
            string QUERY_DINNER = $"SELECT dinner_to_food.FoodID, food.Name, food.Calories, food.Protein, food.Carbohydrates, food.Fat FROM `userfood` INNER JOIN dinner_to_food ON userfood.UserFoodID = dinner_to_food.UserDinnerID INNER JOIN food ON dinner_to_food.FoodID = food.FoodID WHERE userfood.Date = DATE '{today_date}' AND userfood.UserID = {user_id}; ";
            string QUERY_SUPPER = $"SELECT supper_to_food.FoodID, food.Name, food.Calories, food.Protein, food.Carbohydrates, food.Fat FROM `userfood` INNER JOIN supper_to_food ON userfood.UserFoodID = supper_to_food.UserSupperID INNER JOIN food ON supper_to_food.FoodID = food.FoodID WHERE userfood.Date = DATE '{today_date}' AND userfood.UserID = {user_id}; ";
            if(food_time == "Breakfast")
            {
                 QUERY = QUERY_BREAKFAST;
            }else if(food_time == "Dinner")
            {
                QUERY = QUERY_DINNER;
            }else if(food_time == "Supper")
            {
                QUERY = QUERY_SUPPER;
            }
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                        all_specific_food.Add(new FoodModel((int)dataReader["FoodID"], dataReader["Name"].ToString(), (decimal)dataReader["Calories"],
                            (decimal)dataReader["Protein"], (decimal)dataReader["Carbohydrates"], (decimal)dataReader["Fat"]));
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();

            }
            return all_specific_food;
        }

        public int GetUserFoodId(int logged_user_id, string today_date)
        {
            string QUERY = $"SELECT UserFoodID FROM userfood WHERE Date like DATE '{today_date}' AND `UserID` LIKE {logged_user_id};";
            int user_food_id = -1;
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                        user_food_id = (int)dataReader["UserFoodID"];
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();

            }
            return user_food_id;
        }
        public bool CheckIfNeedToCreateNewUserFoodDay(string logged_user, string today_date)
        {
            int user_id = GetUserIdFromLogin(logged_user);
            int user_food_id = -1;
            string QUERY = $"SELECT `UserFoodID` FROM `userfood` WHERE `UserID` LIKE {user_id} AND `Date` LIKE DATE '{today_date}'";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                        user_food_id = (int)dataReader["UserFoodID"];
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();

            }
            if (user_food_id == -1)
            {
                return true;
            }
            else
            {
                return false;
            }


        }
        public bool CheckIfNeedToCreateNewUserExerciseDay(string logged_user, string today_date)
        {
            int user_id = GetUserIdFromLogin(logged_user);
            int user_exercise_id = -1;
            string QUERY = $"SELECT `UserExercisesID` FROM `userexercises` WHERE `UserID` LIKE {user_id} AND `Date` LIKE DATE '{today_date}'";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                        user_exercise_id = (int)dataReader["UserExercisesID"];
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();

            }
            if (user_exercise_id == -1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public void CreateNewExerciseDay(string logged_user, string today_date)
        {
            int user_id = GetUserIdFromLogin(logged_user);
            string QUERY = $"INSERT INTO `userexercises`(`UserExercisesID`, `UserID`, `Date`, `TotalCaloriesBurned`) VALUES (NULL, {user_id}, DATE '{today_date}', 0)";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                }
                connection.Close();
            }
        }
        public int GetUserExercisesId(int user_id, string today_date)
        {
            string QUERY = $"SELECT UserExercisesID FROM userexercises WHERE Date like DATE '{today_date}' AND `UserID` LIKE {user_id};";
            int user_exercises_id = -1;
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                        user_exercises_id = (int)dataReader["UserExercisesID"];
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();

            }
            return user_exercises_id;
        }
        public void AddExerciseToExerciseDay(string exercise_name, string logged_user, string today_date)
        {
            if (CheckIfNeedToCreateNewUserExerciseDay(logged_user, today_date))
            {
                CreateNewExerciseDay(logged_user, today_date);
            }
            int user_id = GetUserIdFromLogin(logged_user);
            int user_exercises_id = GetUserExercisesId(user_id, today_date);
            string QUERY = $"INSERT INTO `userexercisestoexercise`(`UserExercisesID`, `ExerciseID`) VALUES ({user_exercises_id}, (SELECT `ExerciseID` FROM `exercises` WHERE `Name` LIKE '{exercise_name}'));";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                }
                connection.Close();
            }
        }
        public void CreateNewFoodDay(string logged_user, string today_date)
        {
            int user_id = GetUserIdFromLogin(logged_user);
            string QUERY = $"INSERT INTO `userfood` (`UserFoodID`, `UserID`, `Date`, `TotalCalories`) VALUES (NULL, '{user_id}', DATE '{today_date}', '0');";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                }
                connection.Close();
            }
        }
        public void AddFoodToSpecificFoodTime(string food_name, string food_time, string logged_user, string today_date)
        {
            if (CheckIfNeedToCreateNewUserFoodDay(logged_user, today_date))
            {
                CreateNewFoodDay(logged_user, today_date);
            }
            int user_id = GetUserIdFromLogin(logged_user);
            int user_food_id = GetUserFoodId(user_id, today_date);
            string QUERY = "";
            string QUERY_BREAKFAST = $"INSERT INTO `breakfast_to_food`(`UserBreakfastID`, `FoodID`) VALUES ({user_food_id}, (SELECT `FoodID` FROM `food` WHERE `Name` like '{food_name}'))";
            string QUERY_DINNER = $"INSERT INTO `dinner_to_food`(`UserDinnerID`, `FoodID`) VALUES ({user_food_id}, (SELECT `FoodID` FROM `food` WHERE `Name` like '{food_name}'))";
            string QUERY_SUPPER = $"INSERT INTO `supper_to_food`(`UserSupperID`, `FoodID`) VALUES ({user_food_id}, (SELECT `FoodID` FROM `food` WHERE `Name` like '{food_name}'))";
            if (food_time == "Breakfast")
            {
                QUERY = QUERY_BREAKFAST;
            }
            else if (food_time == "Dinner")
            {
                QUERY = QUERY_DINNER;
            }
            else if (food_time == "Supper")
            {
                QUERY = QUERY_SUPPER;
            }
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                }
                connection.Close();
            }
        }
        public void DeleteFood(string logged_user, string food_name, string food_time, string today_date)
        {
            int user_id = GetUserIdFromLogin(logged_user);
            int user_food_id = GetUserFoodId(user_id, today_date);
            string QUERY = "";
            string QUERY_BREAKFAST = $"DELETE FROM `breakfast_to_food` WHERE `FoodID` = (SELECT `FoodID` FROM `food` WHERE `Name` like '{food_name}' AND `UserBreakfastID` LIKE {user_food_id});";
            string QUERY_DINNER = $"DELETE FROM `dinner_to_food` WHERE `FoodID` = (SELECT `FoodID` FROM `food` WHERE `Name` like '{food_name}' AND `UserDinnerID` LIKE {user_food_id});";
            string QUERY_SUPPER = $"DELETE FROM `supper_to_food` WHERE `FoodID` = (SELECT `FoodID` FROM `food` WHERE `Name` like '{food_name}' AND `UserSupperID` LIKE {user_food_id});";
            if (food_time == "Breakfast")
            {
                QUERY = QUERY_BREAKFAST;
            }
            else if (food_time == "Dinner")
            {
                QUERY = QUERY_DINNER;
            }
            else if (food_time == "Supper")
            {
                QUERY = QUERY_SUPPER;
            }
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                }
                connection.Close();
            }
        }
        public void DeleteExercise(string logged_user, string exercise_name, string today_date)
        {
            int user_id = GetUserIdFromLogin(logged_user);
            int user_exercises_id = GetUserExercisesId(user_id, today_date);
            string QUERY = $"DELETE FROM `userexercisestoexercise` WHERE `ExerciseID` = (SELECT `ExerciseID` FROM `exercises` WHERE `Name` LIKE '{exercise_name}') AND `UserExercisesID` Like {user_exercises_id};";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                }
                connection.Close();
            }
        }
        public bool CheckIfCanCreateNewUser(string username)
        {
            string username_to_check = "###";
            string QUERY = $"SELECT Login FROM `users` WHERE `Login` Like '{username}';";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                    if (dataReader.HasRows)
                    {
                        while (dataReader.Read())
                            username_to_check = dataReader["Login"].ToString();
                    }
                    else
                    {
                        Trace.WriteLine("Brak wyników zapytania");
                    }
                }
                connection.Close();
                if(username_to_check == "###")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        public void SignUpUser(string username, string password, string email)
        {
            if (CheckIfCanCreateNewUser(username))
            {
                string QUERY = $"INSERT INTO `users`(`UserID`, `Login`, `Password`, `E-mail`)  VALUES (null,'{username}','{password}','{email}')";
                using (connection = new MySqlConnection(connStrBuilder.ToString()))
                {
                    MySqlCommand command = new MySqlCommand(QUERY, connection);
                    connection.Open();
                    var dataReader = command.ExecuteReader();
                    while (dataReader.Read())
                    {

                    }
                    connection.Close();
                }
            }
            else
            {
                MessageBox.Show("User with this login already exists.");
            }
        }
        public void CreateUserBodyRow(string logged_user)
        {
            int user_id = GetUserIdFromLogin(logged_user);
            string QUERY = $"INSERT INTO `userbodies` (`UserBodyID`, `UserID`, `Weight`, `Height`, `Bodyfat`, `BMI`) VALUES (NULL, '{user_id}', '', '', '', '');";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {

                }
                connection.Close();
            }
        }
        public void CreateUserProfileRow(string logged_user)
        {
            int user_id = GetUserIdFromLogin(logged_user);
            string QUERY = $"INSERT INTO `userprofiles` (`UserProfileID`, `UserID`, `FirstName`, `LastName`, `Gender`, `City`, `Address`, `Phone`) VALUES (NULL, '{user_id}', '', '', '', '', '', '');";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {

                }
                connection.Close();
            }
        }
        public UserProfileModel GetUserProfileData(string logged_user)
        {
            UserProfileModel user_profile_model = new UserProfileModel();
            int user_id = GetUserIdFromLogin(logged_user);
            string QUERY = $"SELECT * FROM `userprofiles` WHERE `UserID` = {user_id};";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        user_profile_model = new UserProfileModel((int)dataReader["UserProfileID"], (int)dataReader["UserID"], dataReader["FirstName"].ToString(), dataReader["LastName"].ToString(), dataReader["Gender"].ToString(), dataReader["City"].ToString(), dataReader["Address"].ToString(), dataReader["Phone"].ToString());
                    }
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
            }
            return user_profile_model;

        }
        public UserBodyModel GetUserBodyData(string logged_user)
        {
            UserBodyModel user_body_model = new UserBodyModel();
            int user_id = GetUserIdFromLogin(logged_user);
            string QUERY = $"SELECT * FROM `userbodies` WHERE `UserID` = {user_id};";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                        user_body_model = new UserBodyModel((int)dataReader["UserBodyID"], (int)dataReader["UserID"], dataReader["Weight"].ToString(), dataReader["Height"].ToString(), dataReader["Bodyfat"].ToString(), dataReader["BMI"].ToString());
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
            }
            return user_body_model;
        } 
        public bool CheckIfNeedToCreateUserProfile(string logged_user)
        {
            int user_id = GetUserIdFromLogin(logged_user);
            int user_profile_id = -1;
            string QUERY = $"SELECT * FROM `userprofiles` WHERE `UserID` = {user_id};";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                        user_profile_id = (int)dataReader["UserID"];
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();
                if (user_profile_id == -1)
                    return true;
                else
                    return false;
            }
        }
        public bool CheckIfNeedToCreateUserBody(string logged_user)
        {
            int user_id = GetUserIdFromLogin(logged_user);
            int user_body_id = -1;
            string QUERY = $"SELECT * FROM `userbodies` WHERE `UserID` = {user_id};";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                        user_body_id = (int)dataReader["UserID"];
                }
                else
                {
                    Trace.WriteLine("Brak wyników zapytania");
                }
                connection.Close();
                if (user_body_id == -1)
                    return true;
                else
                    return false;
            }
        }
        public void UpdateUserProfileRow(string logged_user, string first_name, string last_name, string gender, string city, string address, string phone)
        {
            if (CheckIfNeedToCreateUserProfile(logged_user))
            {
                CreateUserProfileRow(logged_user);
            }
            int user_id = GetUserIdFromLogin(logged_user);
            string QUERY = $"UPDATE `userprofiles` SET `FirstName` = '{first_name}', `LastName` = '{last_name}', `Gender` = '{gender}', `City` = '{city}', `Address` = '{address}', `Phone` = '{phone}' WHERE `userprofiles`.`UserID` = {user_id};";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {

                }
                connection.Close();
            }
            MessageBox.Show("Data updated");
            
            
        }
        public void UpdateUserBodyRow(string logged_user, string weight, string height, string bodyfat, string bmi)
        {
            if (CheckIfNeedToCreateUserBody(logged_user))
            {
                CreateUserBodyRow(logged_user);
            }
            int user_id = GetUserIdFromLogin(logged_user);
            string QUERY = $"UPDATE `userbodies` SET `Weight` = '{weight}', `Height` = '{height}', `Bodyfat` = '{bodyfat}', `BMI` = '{bmi}' WHERE `userbodies`.`UserID` = {user_id};";
            using (connection = new MySqlConnection(connStrBuilder.ToString()))
            {
                MySqlCommand command = new MySqlCommand(QUERY, connection);
                connection.Open();
                var dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {

                }
                connection.Close();
            }
            MessageBox.Show("Data updated");
        }
    }
}
