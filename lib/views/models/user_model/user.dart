// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_setters_without_getters
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/model/order.dart';
part 'user.g.dart';

@JsonSerializable()
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
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
