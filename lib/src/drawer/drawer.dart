// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/translation/locale_keys.g.dart';

class DrawerWidget extends StatelessWidget with BaseModelView {
  DrawerWidget({required this.userRole, super.key});
  final String userRole;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      width: screenWidth * 0.7 < 600 ? screenWidth * 0.7 : screenWidth = 400,
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 50,
          ),
          TextButton(
            onPressed: () {
              navService.navigateToPage(path: NavigationConstants.orderAddPage);
            },
            child: Row(
              children: [
                const SizedBox(width: 50, child: Icon(Icons.add_shopping_cart)),
                SizedBox(
                  width: 130,
                  child: Text(
                    LocaleKeys.drawer_addOrderDrawer.tr(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              navService.navigateToPage(
                path: NavigationConstants.orderListPage,
              );
            },
            child: Row(
              children: [
                const SizedBox(width: 50, child: Icon(Icons.shopping_cart)),
                SizedBox(
                  width: 130,
                  child: Text(
                    LocaleKeys.drawer_orderListDrawer.tr(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              navService.navigateToPage(
                path: NavigationConstants.productAddPage,
              );
            },
            child: Row(
              children: [
                const SizedBox(width: 50, child: Icon(Icons.add_box)),
                SizedBox(
                  width: 130,
                  child: Text(
                    LocaleKeys.drawer_addProductDrawer.tr(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              navService.navigateToPage(
                path: NavigationConstants.productListPage,
              );
            },
            child: Row(
              children: [
                const SizedBox(width: 50, child: Icon(Icons.widgets)),
                SizedBox(
                  width: 130,
                  child: Text(
                    LocaleKeys.drawer_productListDrawer.tr(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              navService.navigateToPage(
                path: NavigationConstants.customerAddPage,
              );
            },
            child: Row(
              children: [
                const SizedBox(width: 50, child: Icon(Icons.group_add)),
                SizedBox(
                  width: 130,
                  child: Text(
                    LocaleKeys.drawer_addCustomerDrawer.tr(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              navService.navigateToPage(
                path: NavigationConstants.customerListPage,
              );
            },
            child: Row(
              children: [
                const SizedBox(width: 50, child: Icon(Icons.groups)),
                SizedBox(
                  width: 130,
                  child: Text(
                    LocaleKeys.drawer_customerListDrawer.tr(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              navService.navigateToPage(
                path: NavigationConstants.courierAddPage,
              );
            },
            child: Row(
              children: [
                const SizedBox(width: 50, child: Icon(Icons.moped)),
                SizedBox(
                  width: 130,
                  child: Text(
                    LocaleKeys.drawer_addCourierDrawer.tr(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              navService.navigateToPage(
                path: NavigationConstants.courierListPage,
              );
            },
            child: Row(
              children: [
                const SizedBox(width: 50, child: Icon(Icons.group)),
                SizedBox(
                  width: 130,
                  child: Text(
                    LocaleKeys.drawer_courierListDrawer.tr(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
