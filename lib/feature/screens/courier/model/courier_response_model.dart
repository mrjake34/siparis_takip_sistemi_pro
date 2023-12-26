import 'package:json_annotation/json_annotation.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';

import 'courier_model.dart';

part 'courier_response_model.g.dart';

@JsonSerializable()
final class CourierResponseModel
    extends IBaseNetworkModel<CourierResponseModel> {
  CourierResponseModel({
    this.message,
    this.couriers,
  });

  factory CourierResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CourierResponseModelFromJson(json);
  final String? message;
  final List<CourierModel>? couriers;

  CourierResponseModel copyWith({
    String? message,
    List<CourierModel>? couriers,
  }) =>
      CourierResponseModel(
        message: message ?? this.message,
        couriers: couriers ?? this.couriers,
      );

  @override
  Map<String, dynamic> toJson() => _$CourierResponseModelToJson(this);

  @override
  CourierResponseModel fromJson(Map<String, dynamic> json) {
    return _$CourierResponseModelFromJson(json);
  }

  @override
  List<Object?> get props => [message, couriers];
}
