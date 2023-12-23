class Meal {
  final String mealTime, name, discription, imgPath;
  final int protien, carbs, fats, calories;
  final List ingredients;

  Meal(
      {required this.mealTime,
      required this.imgPath,
      required this.name,
      required this.carbs,
      required this.protien,
      required this.ingredients,
      required this.calories,
      required this.fats,
      required this.discription});
}

final meals_today = [
  Meal(
    mealTime: "BREAKFAST",
    name: "Maggie",
    protien: 9,
    calories: 400,
    carbs: 53,
    fats: 12,
    imgPath:
        "https://www.iwmbuzz.com/wp-content/uploads/2022/06/make-tasty-garlic-maggie-at-home-heres-the-recipe-920x518.jpg",
    ingredients: [
      "1 cup of granola",
      "1 banana",
      "1/2 cup of raisins",
      "1 tbsp of honey",
    ],
    discription: '''hello''',
  ),
  Meal(
    mealTime: "LUNCH",
    name: "Rajma Chawal",
    protien: 15,
    calories: 300,
    carbs: 60,
    fats: 10,
    imgPath:
        "https://www.secondrecipe.com/wp-content/uploads/2017/08/rajma-chawal-1.jpg",
    ingredients: [
      "1 cup of granola",
      "1 banana",
      "1/2 cup of raisins",
      "1 tbsp of honey",
    ],
    discription: '''hello''',
  ),
  Meal(
    mealTime: "DINNER",
    name: "Aloo Parantha",
    protien: 8,
    calories: 350,
    carbs: 40,
    fats: 15,
    imgPath:
        "https://www.vegrecipesofindia.com/wp-content/uploads/2009/08/aloo-paratha-recipe-2.jpg",
    ingredients: [
      "1 cup of granola",
      "1 banana",
      "1/2 cup of raisins",
      "1 tbsp of honey",
    ],
    discription: '''hello''',
  ),
];

final meals_tommorrow = [
  Meal(
    mealTime: "BREAKFAST",
    name: "Samonsa",
    protien: 5,
    calories: 200,
    carbs: 30,
    fats: 15,
    imgPath:
        "https://www.kitchensanctuary.com/wp-content/uploads/2023/10/Samosa-square-FS.jpg",
    ingredients: [
      "1 cup of granola",
      "1 banana",
      "1/2 cup of raisins",
      "1 tbsp of honey",
    ],
    discription: '''hello''',
  ),
  Meal(
    mealTime: "LUNCH",
    name: "Chicken Curry",
    protien: 30,
    calories: 300,
    carbs: 20,
    fats: 20,
    imgPath:
        "https://myfoodstory.com/wp-content/uploads/2020/10/Dhaba-Style-Chicken-Curry-2-500x500.jpg",
    ingredients: [
      "1 cup of granola",
      "1 banana",
      "1/2 cup of raisins",
      "1 tbsp of honey",
    ],
    discription: '''hello''',
  ),
  Meal(
    mealTime: "DINNER",
    name: "Chole Bhature",
    protien: 15,
    calories: 600,
    carbs: 60,
    fats: 25,
    imgPath:
        "https://static.toiimg.com/thumb/53314156.cms?width=1200&height=900",
    ingredients: [
      "1 cup of granola",
      "1 banana",
      "1/2 cup of raisins",
      "1 tbsp of honey",
    ],
    discription: '''hello''',
  ),
];
