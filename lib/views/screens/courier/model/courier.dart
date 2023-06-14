// ignore_for_file: public_member_api_docs, sort_constructors_first,
// avoid_equals_and_hash_code_on_mutable_classes

import 'package:json_annotation/json_annotation.dart';

part 'courier.g.dart';

@JsonSerializable()
class CourierList {
  final String message;
  final List<Courier> couriers;

  CourierList({
    required this.message,
    required this.couriers,
  });

  CourierList copyWith({
    String? message,
    List<Courier>? couriers,
  }) =>
      CourierList(
        message: message ?? this.message,
        couriers: couriers ?? this.couriers,
      );

  factory CourierList.fromJson(Map<String, dynamic> json) =>
      _$CourierListFromJson(json);

  Map<String, dynamic> toJson() => _$CourierListToJson(this);
}

@JsonSerializable()
class Courier {
  final String? id;
  final String? shopName;
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? role;
  final List<dynamic>? orders;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? ip;
  final String? refreshToken;

  Courier({
    this.id,
    this.shopName,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.role,
    this.orders,
    this.createdAt,
    this.updatedAt,
    this.ip,
    this.refreshToken,
  });

  Courier copyWith({
    String? id,
    String? shopName,
    String? name,
    String? phone,
    String? email,
    String? password,
    String? role,
    List<dynamic>? orders,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? ip,
    String? refreshToken,
  }) =>
      Courier(
        id: id ?? this.id,
        shopName: shopName ?? this.shopName,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password,
        role: role ?? this.role,
        orders: orders ?? this.orders,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ip: ip ?? this.ip,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory Courier.fromJson(Map<String, dynamic> json) =>
      _$CourierFromJson(json);

  Map<String, dynamic> toJson() => _$CourierToJson(this);
}
