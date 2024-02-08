// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourierModel _$CourierModelFromJson(Map<String, dynamic> json) => CourierModel(
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

Map<String, dynamic> _$CourierModelToJson(CourierModel instance) =>
    <String, dynamic>{
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
