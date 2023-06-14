// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

OrderList orderListFromJson(String str) =>
    OrderList.fromJson(jsonDecode(str) as Map<String, dynamic>);

String orderListToJson(OrderList data) => json.encode(data.toJson());

class OrderList {
  const OrderList({
    required this.message,
    required this.order,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        message: json['message'].toString(),
        order: List<Order>.from(
          (json['products'] as List<dynamic>)
              .map((dynamic x) => Order.fromJson(x as Map<String, dynamic>)),
        ),
      );
  final String message;
  final List<Order> order;

  OrderList copyWith({
    String? message,
    List<Order>? order,
  }) =>
      OrderList(
        message: message ?? this.message,
        order: order ?? this.order,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'products': List<dynamic>.from(order.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    required this.id,
    required this.shopName,
    required this.customerId,
    required this.products,
    required this.orderNote,
    required this.totalPrice,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['_id'].toString(),
        shopName: shopNameValues.map[json['shopName']]!,
        customerId: customerIdValues.map[json['customerId']]!,
        products: List<ProductProduct>.from(
          (json['products'] as List<dynamic>).map(
            (dynamic x) => ProductProduct.fromJson(x as Map<String, dynamic>),
          ),
        ),
        orderNote: json['orderNote'].toString(),
        totalPrice: double.tryParse(json['totalPrice'].toString()) ?? 0.0,
        orderStatus: json['orderStatus'].toString(),
        createdAt: DateTime.parse(json['createdAt'].toString()),
        updatedAt: DateTime.parse(json['updatedAt'].toString()),
      );
  final String id;
  final ShopName shopName;
  final CustomerId customerId;
  final List<ProductProduct> products;
  final String orderNote;
  final double totalPrice;
  final String orderStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  Order copyWith({
    String? id,
    ShopName? shopName,
    CustomerId? customerId,
    List<ProductProduct>? products,
    String? orderNote,
    double? totalPrice,
    String? orderStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Order(
        id: id ?? this.id,
        shopName: shopName ?? this.shopName,
        customerId: customerId ?? this.customerId,
        products: products ?? this.products,
        orderNote: orderNote ?? this.orderNote,
        totalPrice: totalPrice ?? this.totalPrice,
        orderStatus: orderStatus ?? this.orderStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'shopName': shopNameValues.reverse[shopName],
        'customerId': customerIdValues.reverse[customerId],
        'products': List<dynamic>.from(products.map((x) => x.toJson())),
        'orderNote': orderNote,
        'totalPrice': totalPrice,
        'orderStatus': orderStatus,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}

enum CustomerId {
  THE_643_DCB2_AFD17_C75_B9_D1702_A0,
  THE_644270_BBC71_AAD97681716_AA,
  THE_64427447_D2_AB860_EBE0_A718_F
}

final customerIdValues = EnumValues({
  '643dcb2afd17c75b9d1702a0': CustomerId.THE_643_DCB2_AFD17_C75_B9_D1702_A0,
  '644270bbc71aad97681716aa': CustomerId.THE_644270_BBC71_AAD97681716_AA,
  '64427447d2ab860ebe0a718f': CustomerId.THE_64427447_D2_AB860_EBE0_A718_F
});

class ProductProduct {
  ProductProduct({
    required this.productId,
    required this.quantity,
    required this.id, this.productNote,
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        productId: json['productId'].toString(),
        quantity: json['quantity'].toString(),
        productNote: json['productNote'].toString(),
        id: json['_id'].toString(),
      );
  final String productId;
  final String quantity;
  final String? productNote;
  final String id;

  ProductProduct copyWith({
    String? productId,
    String? quantity,
    String? productNote,
    String? id,
  }) =>
      ProductProduct(
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        productNote: productNote ?? this.productNote,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'quantity': quantity,
        'productNote': productNote,
        '_id': id,
      };
}

enum ShopName { EFES_TECH }

final shopNameValues = EnumValues({'Efes Tech': ShopName.EFES_TECH});

class EnumValues<T> {
  EnumValues(this.map);
  Map<String, T> map;
  late Map<T, String> reverseMap;

  Map<T, String> get reverse {
    return reverseMap = map.map((k, v) => MapEntry(v, k));
  }
}
