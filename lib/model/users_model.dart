import 'package:flutter/material.dart';

class UsersModel with ChangeNotifier {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  UsersModel(
      {this.id,
      this.email,
      this.password,
      this.name,
      this.role,
      this.avatar,
      this.creationAt,
      this.updatedAt});

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  static List<UsersModel> userFromSnapShot(List prudoctSnapShot) {
    return prudoctSnapShot.map((data) {
      return UsersModel.fromJson(data);
    }).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['email'] = this.email;
  //   data['password'] = this.password;
  //   data['name'] = this.name;
  //   data['role'] = this.role;
  //   data['avatar'] = this.avatar;
  //   data['creationAt'] = this.creationAt;
  //   data['updatedAt'] = this.updatedAt;
  //   return data;
  // }
}
