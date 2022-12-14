import 'package:flutter/cupertino.dart';

import '../model/category.dart';
import '../service/meal_service.dart';

enum CategoryState { idle, busy, error }

class CategoryViewModel with ChangeNotifier {
  List<CategoryElement> categories = [];
  CategoryState _state = CategoryState.busy;

  CategoryViewModel() {
    _state = CategoryState.idle;
    fetchCategories();
  }

  CategoryState get state => _state;
  set state(CategoryState state) {
    _state = state;
    notifyListeners();
  }

  fetchCategories() async {
    try {
      state = CategoryState.busy;
      categories = await MealService().fetchCategoryList();
      state = CategoryState.idle;
    } catch (e) {
      state = CategoryState.error;
    }
  }
}
