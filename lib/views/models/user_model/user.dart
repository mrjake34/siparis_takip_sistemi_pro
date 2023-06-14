// ignore_for_file: avoid_setters_without_getters

import 'package:flutter/cupertino.dart';

import 'package:siparis_takip_sistemi_pro/views/screens/orders/model/order.dart';

class User {
  User({
    this.role,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.shopName,
    this.paymentStatus,
    this.updatedAt,
  });

  User.fromJson(Map<String, String> json)
      : shopName = json['shopName'],
        id = json['_id'],
        role = json['role'],
        updatedAt = json['updatedAt'],
        paymentStatus = bool.tryParse(json['paymentStatus'] ?? ''),
        name = json['name'],
        email = json['email'],
        password = json['password'],
        phone = json['phone'];

  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? shopName;
  final String? role;
  final bool? paymentStatus;
  final String? updatedAt;
  final List<Order> orderList = [];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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

  set setUserId(String value) {
    id = value;
    notifyListeners();
  }

  String? get userRole => role;

  set setUserRole(String value) {
    role = value;
    notifyListeners();
  }
}
