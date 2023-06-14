import 'dart:convert';

import 'package:siparis_takip_sistemi_pro/views/screens/orders/model/order.dart';

CustomerList customerListFromJson(String str) =>
    CustomerList.fromJson(jsonDecode(str) as Map<String, dynamic>);

String customerListToJson(CustomerList data) => jsonEncode(data.toJson());

class CustomerList {
  const CustomerList({
    required this.message,
    this.customers = const [],
  });

  factory CustomerList.fromJson(Map<String, dynamic> json) => CustomerList(
        message: json['message'].toString(),
        customers: (json['customers'] as List<dynamic>?)
            ?.map(
              (customerJson) =>
                  Customer.fromJson(customerJson as Map<String, dynamic>),
            )
            .toList(),
      );
  final String message;
  final List<Customer>? customers;

  CustomerList copyWith({
    String? message,
    List<Customer>? customers,
  }) =>
      CustomerList(
        message: message ?? this.message,
        customers: customers ?? this.customers,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'customers': customers?.map((customer) => customer.toJson()).toList(),
      };
}

class Customer {
  const Customer({
    this.id,
    this.shopName,
    this.name,
    this.phone,
    this.address,
    this.longitude,
    this.latitude,
    this.orders,
    this.createdAt,
    this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['_id'].toString(),
        shopName: json['shopName'].toString(),
        name: json['name'].toString(),
        phone: json['phone'].toString(),
        address: json['adress'].toString(),
        longitude: double.tryParse(json['longitude'].toString()) ??
            0.0, // Changed to double.tryParse
        latitude: double.tryParse(json['latitude'].toString()) ??
            0.0, // Changed to double.tryParse
        orders: orderListFromJson(json['orders'].toString()),
        createdAt: DateTime.tryParse(json['createdAt'].toString()) ??
            DateTime.now(), // Changed to DateTime.tryParse
        updatedAt: DateTime.tryParse(json['updatedAt'].toString()) ??
            DateTime.now(), // Changed to DateTime.tryParse
      );
  final String? id;
  final String? shopName;
  final String? name;
  final String? phone;
  final String? address;
  final double? longitude;
  final double? latitude;
  final OrderList? orders;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Customer copyWith({
    String? id,
    String? shopName,
    String? name,
    String? phone,
    String? address,
    double? longitude,
    double? latitude,
    OrderList? orders,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Customer(
        id: id ?? this.id,
        shopName: shopName ?? this.shopName,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        orders: orders ?? this.orders,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'shopName': shopName,
        'name': name,
        'phone': phone,
        'adress': address,
        'longitude': longitude.toString(), 
        'latitude': latitude.toString(), 
        'orders':
            orderListToJson(orders ?? const OrderList(message: '', order: [])),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}


OrderList orderListFromJson(String str) =>
    OrderList.fromJson(jsonDecode(str) as Map<String, dynamic>);
String orderListToJson(OrderList data) => jsonEncode(data.toJson());
