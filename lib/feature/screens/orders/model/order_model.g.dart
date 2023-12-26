// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String?,
      shopName: json['shopName'] as String?,
      customerId: json['customerId'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => OrderProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderNote: json['orderNote'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      orderStatus: json['orderStatus'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopName': instance.shopName,
      'customerId': instance.customerId,
      'products': instance.products,
      'orderNote': instance.orderNote,
      'totalPrice': instance.totalPrice,
      'orderStatus': instance.orderStatus,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
