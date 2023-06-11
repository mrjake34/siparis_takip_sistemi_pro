// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

OrderList orderListFromJson(String str) => OrderList.fromJson(json.decode(str));

String orderListToJson(OrderList data) => json.encode(data.toJson());

class OrderList {
  OrderList({
    this.message,
    this.order,
  });

  final String? message;
  final List<Order>? order;
  @override
  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        message: json["message"],
        order: List<Order>.from(json["products"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "products": List<dynamic>.from(order?.map((x) => x.toJson()) ?? []),
      };

}

class Order {
  Order({
    required this.id,
    required this.shopName,
    required this.customerId,
    required this.products,
    this.orderNote,
    required this.totalPrice,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String shopName;
  final String customerId;
  final List<ProductProduct> products;
  final String? orderNote;
  final double totalPrice;
  final String orderStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        shopName: json["shopName"],
        customerId: json["customerId"],
        products: List<ProductProduct>.from(
            json["products"].map((x) => ProductProduct.fromJson(x))),
        orderNote: json["orderNote"],
        totalPrice: json["totalPrice"]?.toDouble(),
        orderStatus: json["orderStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "shopName": shopName,
        "customerId": customerId,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "orderNote": orderNote,
        "totalPrice": totalPrice,
        "orderStatus": orderStatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.shopName == shopName &&
        other.customerId == customerId &&
        listEquals(other.products, products) &&
        other.orderNote == orderNote &&
        other.totalPrice == totalPrice &&
        other.orderStatus == orderStatus &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shopName.hashCode ^
        customerId.hashCode ^
        products.hashCode ^
        orderNote.hashCode ^
        totalPrice.hashCode ^
        orderStatus.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}

class ProductProduct {
  ProductProduct({
    required this.productId,
    required this.quantity,
    this.productNote,
    required this.id,
  });

  final String productId;
  final String quantity;
  final String? productNote;
  final String id;

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        productId: json["productId"],
        quantity: json["quantity"],
        productNote: json["productNote"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "productNote": productNote,
        "_id": id,
      };

  @override
  bool operator ==(covariant ProductProduct other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.quantity == quantity &&
        other.productNote == productNote &&
        other.id == id;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        quantity.hashCode ^
        productNote.hashCode ^
        id.hashCode;
  }
}
