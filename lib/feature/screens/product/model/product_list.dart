import 'package:json_annotation/json_annotation.dart';

import '../../../../product/core/base/interface/base_network_model.dart';
import 'product.dart';

part 'product_list.g.dart';

@JsonSerializable(
  includeIfNull: true,
)
final class ProductList extends IBaseNetworkModel<ProductList> {
  ProductList({
    this.products,
  });

  final List<Product>? products;

  @override
  Map<String, dynamic> toJson() => _$ProductListToJson(this);

  @override
  ProductList fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);

  @override
  List<Object?> get props => [
        products,
      ];
}
