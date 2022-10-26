// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
    CategoryModel({
        this.id,
        this.categoryNameUz,
        this.categoryNameRu,
    });

    int? id;
    String? categoryNameUz;
    String? categoryNameRu;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        categoryNameUz: json["category_name_uz"],
        categoryNameRu: json["category_name_ru"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name_uz": categoryNameUz,
        "category_name_ru": categoryNameRu,
    };
}
