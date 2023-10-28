import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/src/button/navbar_button.dart';

import '../../core/constants/navigation/navigation_constants.dart';
import '../../core/utils/navigation/navigation_service.dart';
import '../../core/utils/translation/locale_keys.g.dart';

final class NavbarButtons extends StatelessWidget {
  NavbarButtons({
    super.key,
  });

  final NavigationService navService = NavigationService.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NavbarButton(
          onPressed: () {
            navService.navigateToPage(path: NavigationConstants.homePageView);
          },
          icon: Icons.home,
          text: LocaleKeys.mainText_homepage,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {
            navService.navigateToPage(path: NavigationConstants.orderAddPage);
          },
          icon: Icons.add_shopping_cart,
          text: LocaleKeys.drawer_addOrderDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {
            navService.navigateToPage(
              path: NavigationConstants.orderListPage,
            );
          },
          text: LocaleKeys.drawer_orderListDrawer,
          icon: Icons.shopping_cart,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {
            navService.navigateToPage(
              path: NavigationConstants.productAddPage,
            );
          },
          icon: Icons.add_box,
          text: LocaleKeys.drawer_addProductDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {
            navService.navigateToPage(
              path: NavigationConstants.productListPage,
            );
          },
          icon: Icons.widgets,
          text: LocaleKeys.drawer_productListDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {
            navService.navigateToPage(
              path: NavigationConstants.customerAddPage,
            );
          },
          icon: Icons.group_add,
          text: LocaleKeys.drawer_addCustomerDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {
            navService.navigateToPage(
              path: NavigationConstants.customerListPage,
            );
          },
          icon: Icons.groups,
          text: LocaleKeys.drawer_customerListDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {
            navService.navigateToPage(
              path: NavigationConstants.courierAddPage,
            );
          },
          icon: Icons.moped,
          text: LocaleKeys.drawer_addCourierDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {
            navService.navigateToPage(
              path: NavigationConstants.courierListPage,
            );
          },
          icon: Icons.group,
          text: LocaleKeys.drawer_courierListDrawer,
        ),
      ],
    );
  }
}
