import 'package:flutter/material.dart';

import 'product.dart';

@immutable
final class ProductList {
  const ProductList({
    required this.message,
    required this.products,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        message: json['message'].toString(),
        products: List<Product>.from(
          (json['products'] as List<dynamic>).map(
            (dynamic x) => Product.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );

  final String message;
  final List<Product> products;

  Map<String, dynamic> toJson() => {
        'message': message,
        'products': List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
