import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';

part 'customer_model.g.dart';

@JsonSerializable()
@immutable
final class CustomerModel extends IBaseNetworkModel<CustomerModel> {
  CustomerModel({
    this.id,
    this.shopName,
    this.name,
    this.phone,
    this.adress,
    this.longitude,
    this.latitude,
    this.orders,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
  @JsonKey(name: '_id')
  final String? id;
  final String? shopName;
  final String? name;
  final String? phone;
  final String? adress;
  final double? longitude;
  final double? latitude;
  final List<dynamic>? orders;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CustomerModel copyWith({
    String? id,
    String? shopName,
    String? name,
    String? phone,
    String? adress,
    double? longitude,
    double? latitude,
    List<dynamic>? orders,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CustomerModel(
        id: id ?? this.id,
        shopName: shopName ?? this.shopName,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        adress: adress ?? this.adress,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        orders: orders ?? this.orders,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        shopName,
        name,
        phone,
        adress,
        longitude,
        latitude,
        orders,
        createdAt,
        updatedAt,
      ];

  @override
  CustomerModel fromJson(Map<String, dynamic> json) {
    return CustomerModel.fromJson(json);
  }
}
