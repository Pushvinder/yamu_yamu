import 'dart:convert';

import 'package:yamu/screens/dashboard/home/model/home_banner.dart';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  List<Message> message;
  List<Category> categories;

  CategoriesModel({
    required this.message,
    required this.categories,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  String categoryId;
  String? languageId;
  String name;
  String image;

  Category({
    required this.categoryId,
    this.languageId,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    languageId: json["language_id"],
    name: json["name"],
    image:json["image"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "language_id": languageId,
    "name": name,
    "image": image,
  };
}
