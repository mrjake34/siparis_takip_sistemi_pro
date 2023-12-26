import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';

part 'customer.g.dart';

@JsonSerializable()
final class CustomerList extends IBaseNetworkModel<CustomerList> {
  CustomerList({
    this.message,
    this.customers,
  });

  factory CustomerList.fromJson(Map<String, dynamic> json) =>
      _$CustomerListFromJson(json);
  final String? message;
  final List<Customer>? customers;

  CustomerList copyWith({
    String? message,
    List<Customer>? customers,
  }) =>
      CustomerList(
        message: message ?? this.message,
        customers: customers ?? this.customers,
      );

  @override
  Map<String, dynamic> toJson() => _$CustomerListToJson(this);

  @override
  CustomerList fromJson(Map<String, dynamic> json) {
    return CustomerList.fromJson(json);
  }

  @override
  List<Object?> get props => [message, customers];
}

@JsonSerializable()
@immutable
final class Customer extends IBaseNetworkModel<Customer> {
  Customer({
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

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
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

  Customer copyWith({
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
      Customer(
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
  Map<String, dynamic> toJson() => _$CustomerToJson(this);

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
  Customer fromJson(Map<String, dynamic> json) {
    return Customer.fromJson(json);
  }
}
