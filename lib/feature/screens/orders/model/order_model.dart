// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

import 'package:easy_localization/easy_localization.dart';
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

  Color getColorFromOrderStatus({String? orderStatus}) => switch (orderStatus) {
        AppStrings.inLineOrderString => AppColors.instance.orderPendingColor,
        AppStrings.inProcessOrderString =>
          AppColors.instance.orderInProcessColor,
        AppStrings.onTheWayOrderString => AppColors.instance.orderOnTheWayColor,
        AppStrings.isCompleteOrderString => AppColors.instance.orderIsDoneColor,
        _ => AppColors.instance.orderPendingColor,
      };

  IconData getIconFromOrderStatus({String? orderStatus}) =>
      switch (orderStatus) {
        AppStrings.inLineOrderString => AppIcons.instance.pendingIcon,
        AppStrings.inProcessOrderString => AppIcons.instance.inProcessIcon,
        AppStrings.isCompleteOrderString => AppIcons.instance.onTheWayIcon,
        AppStrings.onTheWayOrderString => AppIcons.instance.isDoneIcon,
        _ => AppIcons.instance.pendingIcon,
      };

  String getStringFromOrderStatus({String? orderStatus}) =>
      switch (orderStatus) {
        AppStrings.inLineOrderString => LocaleKeys.order_inLine.tr(),
        AppStrings.inProcessOrderString => LocaleKeys.order_inProcess.tr(),
        AppStrings.isCompleteOrderString => LocaleKeys.order_onTheWay.tr(),
        AppStrings.onTheWayOrderString => LocaleKeys.order_isDone.tr(),
        _ => LocaleKeys.order_inLine.tr(),
      };

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
