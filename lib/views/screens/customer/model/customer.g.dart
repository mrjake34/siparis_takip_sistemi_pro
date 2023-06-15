// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerList _$CustomerListFromJson(Map<String, dynamic> json) => CustomerList(
      message: json['message'] as String,
      customers: (json['customers'] as List<dynamic>)
          .map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerListToJson(CustomerList instance) =>
    <String, dynamic>{
      'message': instance.message,
      'customers': instance.customers,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['_id'] as String?,
      shopName: json['shopName'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      adress: json['adress'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      orders: json['orders'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      '_id': instance.id,
      'shopName': instance.shopName,
      'name': instance.name,
      'phone': instance.phone,
      'adress': instance.adress,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'orders': instance.orders,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
