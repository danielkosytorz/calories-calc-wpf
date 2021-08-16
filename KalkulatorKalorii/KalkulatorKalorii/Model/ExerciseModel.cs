using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KalkulatorKalorii
{
    class ExerciseModel
    {
        public int ExerciseID;
        public string Name;
        public int CaloriesBurned;

        public ExerciseModel(int exerciseID, string name, int calories_burned)
        {
            ExerciseID = exerciseID;
            Name = name;
            CaloriesBurned = calories_burned;
        }

        public override string ToString()
        {
            return $"{ExerciseID}. {Name} - Burn: {CaloriesBurned}kcal";
        }
    }
}
