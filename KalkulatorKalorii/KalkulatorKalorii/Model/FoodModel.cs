using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KalkulatorKalorii
{
    class FoodModel
    {
        public int FoodID;
        public string Name;
        public decimal Calories;
        public decimal Protein;
        public decimal Carbohydrates;
        public decimal Fat;

        public FoodModel(int foodID, string name, decimal calories, decimal protein, decimal carbohydrates, decimal fat)
        {
            FoodID = foodID;
            Name = name;
            Calories = calories;
            Protein = protein;
            Carbohydrates = carbohydrates;
            Fat = fat;
        }

        public override string ToString()
        {
            return $"{FoodID}. {Name} - {Calories}kcal - {Protein}g  - {Carbohydrates}g - {Fat}g";
        }
    }
}
