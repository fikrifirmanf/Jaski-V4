// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  int id;
  String slug;
  String name;
  dynamic description;
  String icon;
  int sort;

  CategoryModel({
    this.id,
    this.slug,
    this.name,
    this.description,
    this.icon,
    this.sort,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        description: json["description"],
        icon: json["icon"],
        sort: json["sort"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "description": description,
        "icon": icon,
        "sort": sort,
      };
}
