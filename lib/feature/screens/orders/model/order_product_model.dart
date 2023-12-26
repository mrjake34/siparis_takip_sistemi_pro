import 'package:json_annotation/json_annotation.dart';

import '../../../../product/core/base/interface/base_network_model.dart';

part 'order_product_model.g.dart';

@JsonSerializable()
final class OrderProductModel extends IBaseNetworkModel<OrderProductModel> {
  OrderProductModel({
    required this.productId,
    required this.quantity,
    required this.id,
    this.productNote,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);
  final String productId;
  final String quantity;
  final String? productNote;
  final String id;

  OrderProductModel copyWith({
    String? productId,
    String? quantity,
    String? productNote,
    String? id,
  }) =>
      OrderProductModel(
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        productNote: productNote ?? this.productNote,
        id: id ?? this.id,
      );

  @override
  Map<String, dynamic> toJson() => _$OrderProductModelToJson(this);

  @override
  OrderProductModel fromJson(Map<String, dynamic> json) {
    return OrderProductModel.fromJson(json);
  }

  @override
  List<Object?> get props => [
        productId,
        quantity,
        productNote,
        id,
      ];
}
