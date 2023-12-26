import 'package:json_annotation/json_annotation.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';

import '../../../../product/core/base/interface/base_network_model.dart';

part 'product_response_model.g.dart';

@JsonSerializable(
  includeIfNull: true,
)
final class ProductResponseModel
    extends IBaseNetworkModel<ProductResponseModel> {
  ProductResponseModel({
    this.data,
    this.message,
  });

  final Product? data;
  final String? message;

  @override
  ProductResponseModel fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      data: json['data'] == null
          ? null
          : Product.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] == null ? null : json['message'] as String?,
    );
  }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'data': data?.toJson(),
      'message': message,
    };
  }

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}
