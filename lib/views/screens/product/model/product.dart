import 'dart:convert';

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str) as Map<String, dynamic>);

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
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

  String message;
  List<Product> products;

  Map<String, dynamic> toJson() => {
        'message': message,
        'products': List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.shopName,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    this.productNote,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id'].toString(),
        name: json['name'].toString(),
        shopName: json['shopName'].toString(),
        price: double.tryParse(json['price'].toString()) ?? 0.0,
        createdAt: DateTime.parse(json['createdAt'].toString()),
        updatedAt: DateTime.parse(json['updatedAt'].toString()),
      );

  String id;
  String name;
  String shopName;
  int quantity = 1;
  String? productNote;
  double price;
  DateTime createdAt;
  DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'shopName': shopName,
        'price': price,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
  double? get totalPrice => price * quantity;
}
