import 'package:json_annotation/json_annotation.dart';

import '../../../../product/core/base/interface/base_network_model.dart';
import 'order_model.dart';

part 'order_response_model.g.dart';

@JsonSerializable()
final class OrderResponseModel extends IBaseNetworkModel<OrderResponseModel> {
  OrderResponseModel({
    required this.message,
    required this.products,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseModelFromJson(json);
  final String message;
  final List<OrderModel> products;

  OrderResponseModel copyWith({
    String? message,
    List<OrderModel>? products,
  }) =>
      OrderResponseModel(
        message: message ?? this.message,
        products: products ?? this.products,
      );

  @override
  Map<String, dynamic> toJson() => _$OrderResponseModelToJson(this);

  @override
  OrderResponseModel fromJson(Map<String, dynamic> json) {
    return OrderResponseModel.fromJson(json);
  }

  @override
  List<Object?> get props => [
        message,
        products,
      ];
}
