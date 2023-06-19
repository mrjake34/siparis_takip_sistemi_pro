// ignore_for_file: file_names
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/icons/icons.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/singletons/cache/shared_manager.dart';
import 'package:siparis_takip_sistemi_pro/core/singletons/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/core/singletons/translation/locale_keys.g.dart';

class MainFunctions {
  MainFunctions._init();
  static final MainFunctions _instance = MainFunctions._init();
  static MainFunctions get instance => _instance;

  Future<dynamic> logOutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            LocaleKeys.mainText_logout.tr(),
            style: const TextStyle(fontSize: 15),
          ),
          content: Text(LocaleKeys.alerts_logoutAlerts.tr()),
          actions: [
            TextButton(
              onPressed: () {
                NavigationService.instance.navigateToBack();
              },
              child: Text(LocaleKeys.mainText_cancel.tr()),
            ),
            TextButton(
              onPressed: () async {
                await SharedManager.instance.clearAll().whenComplete(() {
                  NavigationService.instance.navigateToPageRemoveAll(
                    path: NavigationConstants.loginPage,
                  );
                });
              },
              child: Text(LocaleKeys.mainText_confirm.tr()),
            ),
          ],
        );
      },
    );
  }

  Color getColorFromOrderStatus({String? orderStatus}) {
    switch (orderStatus) {
      case 'waiting':
        return AppColors.instance.orderPendingColor;
      case 'inProcess':
        return AppColors.instance.orderInProcessColor;
      case 'inDistribution':
        return AppColors.instance.orderOnTheWayColor;
      case 'completed':
        return AppColors.instance.orderIsDoneColor;
      default:
        return AppColors.instance.orderPendingColor;
    }
  }

  IconData getIconFromOrderStatus({String? orderStatus}) {
    switch (orderStatus) {
      case 'waiting':
        return AppIcons.instance.pendingIcon;
      case 'inProcess':
        return AppIcons.instance.inProcessIcon;
      case 'inDistribution':
        return AppIcons.instance.onTheWayIcon;
      case 'completed':
        return AppIcons.instance.isDoneIcon;
      default:
        return AppIcons.instance.pendingIcon;
    }
  }

  String getStringFromOrderStatus({String? orderStatus}) {
    switch (orderStatus) {
      case 'waiting':
        return LocaleKeys.order_inLine.tr();
      case 'inProcess':
        return LocaleKeys.order_inProcess.tr();
      case 'inDistribution':
        return LocaleKeys.order_onTheWay.tr();
      case 'completed':
        return LocaleKeys.order_isDone.tr();
      default:
        return LocaleKeys.order_inLine.tr();
    }
  }

  double productTotalPriceCalculator({int? quantity, double? price}) {
    if (quantity != null && price != null) {
      return quantity * price;
    } else {
      return 0;
    }
  }
}
