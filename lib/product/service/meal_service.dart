import 'package:http/http.dart' as http;

import '../model/category.dart';
import '../model/meals.dart';

class MealService {
  final String _baseApi = 'https://www.themealdb.com/api/json/v1/1/';
  final String _category = 'categories.php';
  final String _details = 'lookup.php?i=';

  Future<List<CategoryElement>> fetchCategoryList() async {
    var response = await http.get(Uri.parse(_baseApi + _category));

    if (response.statusCode == 200) {
      var categoryList = categoryFromJson(response.body);
      return categoryList.categories;
    }

    return [];
  }

  Future<List<Meal>> fetchMealList(String categoriesTitle) async {
    var response = await http.get(Uri.parse('${_baseApi}filter.php?c=$categoriesTitle'));

    if (response.statusCode == 200) {
      var mealList = mealsFromJson(response.body);
      return mealList.meals;
    }

    return [];
  }

  Future<List<Meal>> fetchRecipeWithID(String recipeID) async {
    var response = await http.get(Uri.parse(_baseApi + _details + recipeID));

    if (response.statusCode == 200) {
      var mealList = mealsFromJson(response.body);
      
      return mealList.meals;
    }
    return [];
  }
}
