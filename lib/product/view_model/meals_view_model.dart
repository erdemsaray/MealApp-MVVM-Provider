import 'package:flutter/material.dart';

import '../model/meals.dart';
import '../service/meal_service.dart';
import 'category_view_model.dart';

enum MealsState { idle, busy, error }

class MealsViewModel with ChangeNotifier {
  List<Meal> mealsList = [];
  MealsState _state = MealsState.busy;
  String categoryName = '';

  MealsViewModel() {
    _state = MealsState.idle;
    CategoryViewModel _categoryViewModel = CategoryViewModel();
    categoryName = _categoryViewModel.categoriesValue;

    fetchMeals();
  }

  MealsState get state => _state;
  set state(MealsState state) {
    _state = state;
    notifyListeners();
  }

  fetchMeals() async {
    try {
      state = MealsState.busy;
      mealsList = await MealService().fetchMealList(categoryName);
      state = MealsState.idle;
    } catch (e) {
      state = MealsState.error;
    }
  }
}
