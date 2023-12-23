// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      name: json['name'] as String?,
      shopName: json['shopName'] as String?,
      price: json['price'] as num?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      productNote: json['productNote'] as String?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shopName': instance.shopName,
      'quantity': instance.quantity,
      'productNote': instance.productNote,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
