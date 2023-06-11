import 'package:flutter/cupertino.dart';

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? shopName;
  final String? role;
  final bool? paymentStatus;
  final String? updatedAt;
  final List orderList = [];

  User({this.role, this.id, this.name, this.email, this.phone, this.password,
      this.shopName, this.paymentStatus, this.updatedAt});

  User.fromJson(Map<String, dynamic> json)
      : shopName = json['shopName'],
        id = json['_id'],
        role = json['role'],
        updatedAt = json['updatedAt'],
        paymentStatus = json['paymentStatus'],
        name = json['name'],
        email = json['email'],
        password = json['password'],
        phone = json['phone'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shopName'] = shopName;
    data['role'] = role;
    data['_id'] = id;
    data['updatedAt'] = updatedAt;
    data['paymentStatus'] = paymentStatus;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
class UserDetail with ChangeNotifier {
  String? id;
  String? role;

  String? get userId => id;

  set setUserId(String value){
    id = value;
    notifyListeners();
  }
  String? get userRole => role;

  set setUserRole(String value){
    role = value;
    notifyListeners();
  }
}