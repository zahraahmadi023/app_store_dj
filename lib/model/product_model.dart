import 'package:app_store_ut/model/categori_model.dart';
import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;

  CategoryModel? category;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.category,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
  }
  static List<ProductModel> productFromSnapShot(List prudoctSnapShot) {
    //print("data7777777777777 : ${prudoctSnapShot[0]}");

    return prudoctSnapShot.map((data) {
      //print("data2222222:$data");
      return ProductModel.fromJson(data);
    }).toList();
  }
}
