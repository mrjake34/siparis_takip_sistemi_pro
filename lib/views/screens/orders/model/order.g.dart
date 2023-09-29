// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderList _$OrderListFromJson(Map<String, dynamic> json) => OrderList(
      message: json['message'] as String,
      products: (json['products'] as List<dynamic>).map((e) => OrderListProduct.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'message': instance.message,
      'products': instance.products,
    };

OrderListProduct _$OrderListProductFromJson(Map<String, dynamic> json) => OrderListProduct(
      id: json['_id'] as String,
      shopName: json['shopName'] as String,
      customerId: json['customerId'] as String,
      products: (json['products'] as List<dynamic>).map((e) => ProductProduct.fromJson(e as Map<String, dynamic>)).toList(),
      orderNote: json['orderNote'] as String,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderStatus: json['orderStatus'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$OrderListProductToJson(OrderListProduct instance) => <String, dynamic>{
      '_id': instance.id,
      'shopName': instance.shopName,
      'customerId': instance.customerId,
      'products': instance.products,
      'orderNote': instance.orderNote,
      'totalPrice': instance.totalPrice,
      'orderStatus': instance.orderStatus,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

ProductProduct _$ProductProductFromJson(Map<String, dynamic> json) => ProductProduct(
      productId: json['productId'] as String,
      quantity: json['quantity'] as String,
      id: json['id'] as String,
      productNote: json['productNote'] as String?,
    );

Map<String, dynamic> _$ProductProductToJson(ProductProduct instance) => <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
      'productNote': instance.productNote,
      '_id': instance.id,
    };
