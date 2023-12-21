import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'product_list.dart';

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str) as Map<String, dynamic>);

String productListToJson(ProductList data) => json.encode(data.toJson());

@JsonSerializable()
class Product {
  Product({
    this.id,
    this.name,
    this.shopName,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.productNote,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id'].toString(),
        name: json['name'].toString(),
        shopName: json['shopName'].toString(),
        price: json['price'].toString(),
        createdAt: json['createdAt'].toString(),
        updatedAt: json['updatedAt'].toString(),
      );

  final String? id;
  final String? name;
  final String? shopName;
  final int? quantity;
  final String? productNote;
  final String? price;
  final String? createdAt;
  final String? updatedAt;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'shopName': shopName,
        'price': price,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };

  Product copyWith({
    String? id,
    String? name,
    String? shopName,
    String? price,
    String? createdAt,
    String? updatedAt,
    String? productNote,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      shopName: shopName ?? this.shopName,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productNote: productNote ?? this.productNote,
    );
  }

  String? calculateTotalPrice({String? price, int? quantity}) {
    if (price == null || quantity == null) {
      return null;
    }
    final priceForDouble = price.replaceAll(',', '');
    final parsedPrice = double.parse(priceForDouble);
    final totalPrice = parsedPrice * quantity;
    return totalPrice.toStringAsFixed(2);
  }

  double productTotalPriceCalculator({int? quantity, double? price}) {
    if (quantity != null && price != null) {
      return quantity * price;
    } else {
      return 0;
    }
  }
}
