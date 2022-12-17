import 'package:flutter/material.dart';

import '../model/meals.dart';
import '../service/meal_service.dart';

enum DetailsState { idle, busy, error }

class RecipeDetailsModel with ChangeNotifier {
  List<Meal> mealsList = [];
  String recipeID = '52772';
  DetailsState _state = DetailsState.idle;

  RecipeDetailsModel() {
    _state = DetailsState.busy;
  }

  DetailsState get state => _state;
  set state(DetailsState state) {
    _state = state;
    notifyListeners();
  }

  void changeRecipeID(String? id) {
    recipeID = id ??'';
    getRecipeDetails();
    notifyListeners();
  }

  void getRecipeDetails() async {
    try {
      state = DetailsState.busy;
      mealsList = await MealService().fetchRecipeWithID(recipeID);

      state = DetailsState.idle;
    } catch (e) {
      state = DetailsState.error;
    }
  }
}
