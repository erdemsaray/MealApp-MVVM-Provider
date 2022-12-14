// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        required this.categories,
    });

    List<CategoryElement> categories;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        categories: List<CategoryElement>.from(json["categories"].map((x) => CategoryElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class CategoryElement {
    CategoryElement({
        this.idCategory,
        this.strCategory,
        this.strCategoryThumb,
        this.strCategoryDescription,
    });

    String? idCategory;
    String? strCategory;
    String? strCategoryThumb;
    String? strCategoryDescription;

    factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
    );

    Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
    };
}
