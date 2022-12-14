import 'package:http/http.dart' as http;

import '../model/category.dart';

class MealService {
  final String _baseApi = 'https://www.themealdb.com/api/json/v1/1/';
  final String _category = 'categories.php';

  Future<List<CategoryElement>> fetchCategoryList() async {
    var response = await http.get(Uri.parse(_baseApi + _category));

    if (response.statusCode == 200) {
      var Category = categoryFromJson(response.body);
      return Category.categories;
    }

    return [];
  }
}
