// To parse this JSON data, do
//
//     final meals = mealsFromJson(jsonString);

import 'dart:convert';

Meals mealsFromJson(String str) => Meals.fromJson(json.decode(str));

String mealsToJson(Meals data) => json.encode(data.toJson());

class Meals {
  Meals({
    required this.meals,
  });

  List<Meal> meals;

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class Meal {
  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
    this.strInstructions,
  });

  String? strMeal;
  String? strMealThumb;
  String? idMeal;
  String? strInstructions;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
      strMeal: json["strMeal"],
      strMealThumb: json["strMealThumb"],
      idMeal: json["idMeal"],
      strInstructions: json['strInstructions']);

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
