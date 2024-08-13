import 'dart:convert';
import 'dart:developer';

import 'package:app_store_ut/const/api_const.dart';
import 'package:app_store_ut/model/categori_model.dart';
import 'package:app_store_ut/model/product_model.dart';
import 'package:app_store_ut/model/users_model.dart';
import 'package:http/http.dart' as http;

class ApiHandeler {
  static Future<List<dynamic>> getData({required String target}) async {
    try {
      var uri = Uri.https(Base_URL, "/api/v1/$target");

      var response = await http.get(uri);

      List tempList = [];
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }

      for (var v in data) {
        tempList.add(v);
      }
      return tempList;
    } catch (error) {
      log("An e error occurde $error");

      throw error.toString();
    }
  }

  static Future<List<ProductModel>> getAllProduct() async {
    List temp = await getData(target: "products");

    return ProductModel.productFromSnapShot(temp);
  }

  static Future<List<CategoryModel>> getAllCategori() async {
    List temp = await getData(target: "categories");

    return CategoryModel.categoryFromSnapShot(temp);
  }

  static Future<List<UsersModel>> getAllUsers() async {
    List temp = await getData(target: "users");

    return UsersModel.userFromSnapShot(temp);
  }

  static Future<ProductModel> getProductById({required String id}) async {
    try {
      var uri = Uri.https(Base_URL, "/api/v1/products/$id");

      var response = await http.get(uri);

      //List tempList = [];
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }

      // for (var v in data) {
      //   tempList.add(v);

      return ProductModel.fromJson(data);
    } catch (error) {
      log("message error info product $error ");
      throw error.toString();
    }
  }
}

//  static Future<List<productModel>> getAllProduct() async {
//     var uri = Uri.https(Base_URL, "/api/v1/products");

//     var response = await http.get(uri);
//     //print("respons ${jsonDecode(response.body)}");
//     List tempList = [];
//     var data = jsonDecode(response.body);
//     for (var v in data) {
//       tempList.add(v);
//       //print("v : ${v} \n \n");
//     }
//     return productModel.productFromSnapShot(tempList);
//   }