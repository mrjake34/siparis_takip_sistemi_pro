// ignore_for_file: file_names
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/icons/icons.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/strings/appstrings.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/cache/shared_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/router/route_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

final class MainFunctions {
  MainFunctions._init();
  static final MainFunctions _instance = MainFunctions._init();
  static MainFunctions get instance => _instance;

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

  double productTotalPriceCalculator({int? quantity, double? price}) {
    if (quantity != null && price != null) {
      return quantity * price;
    } else {
      return 0;
    }
  }
}
