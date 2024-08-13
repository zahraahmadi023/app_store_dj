import 'package:flutter/material.dart';

class CategoryModel with ChangeNotifier {
  int? id;
  String? name;
  String? image;

  CategoryModel({
    this.id,
    this.name,
    this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;

    return data;
  }

  static List<CategoryModel> categoryFromSnapShot(List prudoctSnapShot) {
    print("object1111111");
    print(prudoctSnapShot[0]);

    return prudoctSnapShot.map((data) {
      return CategoryModel.fromJson(data);
    }).toList();
  }
}
