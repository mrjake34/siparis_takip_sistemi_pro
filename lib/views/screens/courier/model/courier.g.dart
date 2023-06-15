// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourierList _$CourierListFromJson(Map<String, dynamic> json) => CourierList(
      message: json['message'] as String,
      couriers: (json['couriers'] as List<dynamic>)
          .map((e) => Courier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourierListToJson(CourierList instance) =>
    <String, dynamic>{
      'message': instance.message,
      'couriers': instance.couriers,
    };

Courier _$CourierFromJson(Map<String, dynamic> json) => Courier(
      id: json['_id'] as String?,
      shopName: json['shopName'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      orders: json['orders'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      ip: json['ip'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$CourierToJson(Courier instance) => <String, dynamic>{
      '_id': instance.id,
      'shopName': instance.shopName,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'orders': instance.orders,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'ip': instance.ip,
      'refreshToken': instance.refreshToken,
    };
