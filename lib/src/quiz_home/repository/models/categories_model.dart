part of '../availability_repo.dart';

class CategoriesModel {
  CategoriesModel({
    required this.status,
    required this.categoriesData,
  });

  String status;
  CategoriesData categoriesData;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        status: json['status'],
        categoriesData: CategoriesData.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'data': categoriesData.toJson(),
      };
}

class CategoriesData {
  CategoriesData({
    required this.categories,
  });

  List<Category> categories;

  factory CategoriesData.fromJson(Map<String, dynamic> json) => CategoriesData(
        categories: List<Category>.from(
            json['categories'].map((dynamic x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'categories': List<dynamic>.from(
          categories.map((Category x) => x.toJson()),
        ),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['_id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };
}
