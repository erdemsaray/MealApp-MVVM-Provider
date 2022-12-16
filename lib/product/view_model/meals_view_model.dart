import 'package:flutter/material.dart';

import '../model/meals.dart';
import '../service/meal_service.dart';

enum MealsState { idle, busy, error }

class MealsViewModel with ChangeNotifier {
  List<Meal> mealsList = [];
  MealsState _state = MealsState.busy;
  String? categoryName;

  MealsViewModel() {
    _state = MealsState.idle;

    fetchMeals();
  }

  void changeCategory(String newCategory) {
    categoryName = newCategory;
    //kategoriyi değiştirdiğimizde fetch meal fonksiyonunu tekrar çağırıyoruz.
    fetchMeals();
    notifyListeners();
  }

  MealsState get state => _state;
  set state(MealsState state) {
    _state = state;
    notifyListeners();
  }

  fetchMeals() async {
    try {
      state = MealsState.busy;

      mealsList = await MealService().fetchMealList(categoryName ?? 'Chicken');

      state = MealsState.idle;
    } catch (e) {
      state = MealsState.error;
    }
  }
}
