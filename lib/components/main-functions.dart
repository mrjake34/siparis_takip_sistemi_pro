// ignore_for_file: file_names
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/app/app_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/init/cache/shared_manager.dart';
import 'package:siparis_takip_sistemi_pro/core/init/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';

class MainFunctions {
  MainFunctions._init();
  static final MainFunctions _instance = MainFunctions._init();
  static MainFunctions get instance => _instance;

  Future logOutDialog(BuildContext context) {
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
                  child: Text(LocaleKeys.mainText_cancel.tr())),
              TextButton(
                  onPressed: () async {
                    SharedManager.instance.clearAll().whenComplete(() {
                      NavigationService.instance.navigateToPageRemoveAll(
                          path: NavigationConstants.loginPage);
                    });
                  },
                  child: Text(LocaleKeys.mainText_confirm.tr())),
            ],
          );
        });
  }

  Color getColorFromOrderStatus({String? orderStatus}) {
    switch (orderStatus) {
      case "waiting":
        return AppColors.instance.orderPendingColor;
      case "inProcess":
        return AppColors.instance.orderInProcessColor;
      case "inDistribution":
        return AppColors.instance.orderOnTheWayColor;
      case "completed":
        return AppColors.instance.orderIsDoneColor;
      default:
        return AppColors.instance.orderPendingColor;
    }
  }

  IconData getIconFromOrderStatus({String? orderStatus}) {
    switch (orderStatus) {
      case "waiting":
        return AppConstats.instance.pendingIcon;
      case "inProcess":
        return AppConstats.instance.inProcessIcon;
      case "inDistribution":
        return AppConstats.instance.onTheWayIcon;
      case "completed":
        return AppConstats.instance.isDoneIcon;
      default:
        return AppConstats.instance.pendingIcon;
    }
  }

  Text getTextFromOrderStatus({String? orderStatus}) {
    switch (orderStatus) {
      case "waiting":
        return Text(LocaleKeys.order_inLine.tr());
      case "inProcess":
        return Text(LocaleKeys.order_inProcess.tr());
      case "inDistribution":
        return Text(LocaleKeys.order_onTheWay.tr());
      case "completed":
        return Text(LocaleKeys.order_isDone.tr());
      default:
        return Text(LocaleKeys.order_inLine.tr());
    }
  }

  double productTotalPriceCalculator({int? quantity, double? price}) {
    if (quantity != null && price != null) {
      return quantity * price;
    } else {
      return 0.0;
    }
  }
}

