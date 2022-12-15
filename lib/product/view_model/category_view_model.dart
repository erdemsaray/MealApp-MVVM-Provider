import 'package:flutter/material.dart';

import '../model/category.dart';
import '../service/meal_service.dart';
import '../view/meals_view.dart';

enum CategoryState { idle, busy, error }



class CategoryViewModel with ChangeNotifier {
  List<CategoryElement> categories = [];
  CategoryState _state = CategoryState.busy;
  String categoriesValue ='sadasd';


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

  void clickedCard(BuildContext context, categoryName) {
    categoriesValue = categoryName;
    notifyListeners();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RecipesView(),
        ));
  }
}
