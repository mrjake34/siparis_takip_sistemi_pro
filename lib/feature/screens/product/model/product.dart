import 'package:json_annotation/json_annotation.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';

part 'product.g.dart';

@JsonSerializable(
  includeIfNull: true,
)
final class Product extends IBaseNetworkModel<Product> {
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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? shopName;
  final int? quantity;
  final String? productNote;
  final num? price;
  final String? createdAt;
  final String? updatedAt;

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    String? id,
    String? name,
    String? shopName,
    num? price,
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

  @override
  Product fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        shopName,
        price,
        createdAt,
        updatedAt,
        productNote,
      ];
}
