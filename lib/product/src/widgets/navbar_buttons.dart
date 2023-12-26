import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/navbar_button.dart';

import '../../utils/translations/locale_keys.g.dart';

final class NavbarButtons extends StatelessWidget {
  const NavbarButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NavbarButton(
          onPressed: () {},
          icon: Icons.home,
          text: LocaleKeys.mainText_homepage,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {},
          icon: Icons.add_shopping_cart,
          text: LocaleKeys.drawer_addOrderDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {},
          text: LocaleKeys.drawer_orderListDrawer,
          icon: Icons.shopping_cart,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {},
          icon: Icons.add_box,
          text: LocaleKeys.drawer_addProductDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {},
          icon: Icons.widgets,
          text: LocaleKeys.drawer_productListDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {},
          icon: Icons.group_add,
          text: LocaleKeys.drawer_addCustomerDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {},
          icon: Icons.groups,
          text: LocaleKeys.drawer_customerListDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {},
          icon: Icons.moped,
          text: LocaleKeys.drawer_addCourierDrawer,
        ),
        const SizedBox(
          height: 5,
        ),
        NavbarButton(
          onPressed: () {},
          icon: Icons.group,
          text: LocaleKeys.drawer_courierListDrawer,
        ),
      ],
    );
  }
}
