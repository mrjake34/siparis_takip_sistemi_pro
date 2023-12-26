import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../product/core/base/interface/base_network_model.dart';
import '../../../../product/core/constants/colors/colors.dart';
import '../../../../product/core/constants/icons/icons.dart';
import '../../../../product/core/constants/strings/appstrings.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import 'order_product_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
final class OrderModel extends IBaseNetworkModel<OrderModel> {
  OrderModel({
    this.id,
    this.shopName,
    this.customerId,
    this.products,
    this.orderNote,
    this.totalPrice,
    this.orderStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  final String? id;
  final String? shopName;
  final String? customerId;
  final List<OrderProductModel>? products;
  final String? orderNote;
  final double? totalPrice;
  final String? orderStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrderModel copyWith({
    String? id,
    String? shopName,
    String? customerId,
    List<OrderProductModel>? products,
    String? orderNote,
    double? totalPrice,
    String? orderStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      OrderModel(
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

  @override
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  @override
  OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel.fromJson(json);
  }

  @override
  List<Object?> get props => [
        id,
        shopName,
        customerId,
        products,
        orderNote,
        totalPrice,
        orderStatus,
        createdAt,
        updatedAt,
      ];
}

enum OrderStatusEnum {
  @JsonValue(AppStrings.inLineOrderString)
  inLine(
    color: AppColors.orderPendingColor,
    icon: AppIcons.pendingIcon,
    localeKeys: LocaleKeys.order_inLine,
    name: AppStrings.inLineOrderString,
  ),
  @JsonValue(AppStrings.inProcessOrderString)
  inProcess(
    color: AppColors.orderInProcessColor,
    icon: AppIcons.inProcessIcon,
    localeKeys: LocaleKeys.order_inProcess,
    name: AppStrings.inProcessOrderString,
  ),
  @JsonValue(AppStrings.onTheWayOrderString)
  onTheWay(
    color: AppColors.orderOnTheWayColor,
    icon: AppIcons.onTheWayIcon,
    localeKeys: LocaleKeys.order_onTheWay,
    name: AppStrings.onTheWayOrderString,
  ),
  @JsonValue(AppStrings.isCompleteOrderString)
  isComplete(
    color: AppColors.orderIsDoneColor,
    icon: AppIcons.isDoneIcon,
    localeKeys: LocaleKeys.order_isDone,
    name: AppStrings.isCompleteOrderString,
  ),
  ;

  const OrderStatusEnum({
    required this.color,
    required this.icon,
    required this.localeKeys,
    required this.name,
  });

  final Color color;
  final IconData icon;
  final String localeKeys;
  final String name;

  static OrderStatusEnum getStatusValueFromOrderStatus({String? orderStatus}) =>
      switch (orderStatus) {
        AppStrings.inLineOrderString => OrderStatusEnum.inLine,
        AppStrings.inProcessOrderString => OrderStatusEnum.inProcess,
        AppStrings.onTheWayOrderString => OrderStatusEnum.onTheWay,
        AppStrings.isCompleteOrderString => OrderStatusEnum.isComplete,
        _ => OrderStatusEnum.inLine,
      };
}
