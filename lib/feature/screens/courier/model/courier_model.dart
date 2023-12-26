// ignore_for_file: public_member_api_docs, sort_constructors_first,
// avoid_equals_and_hash_code_on_mutable_classes

import 'package:json_annotation/json_annotation.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';

part 'courier_model.g.dart';

@JsonSerializable()
final class CourierModel extends IBaseNetworkModel<CourierModel> {
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

  CourierModel({
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

  CourierModel copyWith({
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
      CourierModel(
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

  factory CourierModel.fromJson(Map<String, dynamic> json) =>
      _$CourierModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CourierModelToJson(this);

  @override
  CourierModel fromJson(Map<String, dynamic> json) {
    return _$CourierModelFromJson(json);
  }

  @override
  List<Object?> get props => [
        id,
        shopName,
        name,
        phone,
        email,
        password,
        role,
        orders,
        createdAt,
        updatedAt,
        ip,
        refreshToken,
      ];
}
