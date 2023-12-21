// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../product/core/constants/colors/colors.dart';
import '../../../../product/core/constants/icons/icons.dart';
import '../../../../product/core/constants/strings/appstrings.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';

part 'order.g.dart';

@JsonSerializable()
final class OrderList {
  OrderList({
    required this.message,
    required this.products,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) =>
      _$OrderListFromJson(json);
  final String message;
  final List<OrderListProduct> products;

  OrderList copyWith({
    String? message,
    List<OrderListProduct>? products,
  }) =>
      OrderList(
        message: message ?? this.message,
        products: products ?? this.products,
      );

  Map<String, dynamic> toJson() => _$OrderListToJson(this);
}

@JsonSerializable()
class OrderListProduct {
  OrderListProduct({
    required this.id,
    required this.shopName,
    required this.customerId,
    required this.products,
    required this.orderNote,
    required this.totalPrice,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderListProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderListProductFromJson(json);
  final String id;
  final String shopName;
  final String customerId;
  final List<ProductProduct> products;
  final String orderNote;
  final double totalPrice;
  final String orderStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderListProduct copyWith({
    String? id,
    String? shopName,
    String? customerId,
    List<ProductProduct>? products,
    String? orderNote,
    double? totalPrice,
    String? orderStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      OrderListProduct(
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

  Map<String, dynamic> toJson() => _$OrderListProductToJson(this);

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
}

@JsonSerializable()
class ProductProduct {
  ProductProduct({
    required this.productId,
    required this.quantity,
    required this.id,
    this.productNote,
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) =>
      _$ProductProductFromJson(json);
  final String productId;
  final String quantity;
  final String? productNote;
  final String id;

  ProductProduct copyWith({
    String? productId,
    String? quantity,
    String? productNote,
    String? id,
  }) =>
      ProductProduct(
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        productNote: productNote ?? this.productNote,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => _$ProductProductToJson(this);
}
