// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_setters_without_getters
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserModel {
  final String message;
  final User user;

  UserModel({
    required this.message,
    required this.user,
  });

  UserModel copyWith({
    String? message,
    User? user,
  }) =>
      UserModel(
        message: message ?? this.message,
        user: user ?? this.user,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class User {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? shopName;
  final String? role;
  final bool? paymentStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? ip;
  final String? refreshToken;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.shopName,
    this.role,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    this.ip,
    this.refreshToken,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? shopName,
    String? role,
    bool? paymentStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? ip,
    String? refreshToken,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        shopName: shopName ?? this.shopName,
        role: role ?? this.role,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ip: ip ?? this.ip,
        refreshToken: refreshToken ?? this.refreshToken,
      );

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
