// ignore_for_file: must_be_immutable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/order_lists/order_list_all_orders.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/order_lists/order_list_completed_orders.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/order_lists/order_list_ontheway_orders.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/order_lists/order_list_pending_orders.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/order_lists/order_list_process_orders.dart';

class OrderListPage extends StatelessWidget with BaseModelView {
  OrderListPage({super.key, this.pageIndex});
  final int? pageIndex;

  final PersistentTabController _controller =
      PersistentTabController();

  List<Widget> orderPages() {
    return [
      OrderListAllOrders(),
      OrderListPendingOrders(),
      OrderListProcessOrders(),
      OrderListOnTheWayOrders(),
      OrderListCompletedOrders(),
    ];
  }

  List<PersistentBottomNavBarItem> bottomNavBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          appIcons.orderListIcon,
          color: appColors.ordersColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          appIcons.pendingIcon,
          color: appColors.orderPendingColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          appIcons.inProcessIcon,
          color: appColors.orderInProcessColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          appIcons.onTheWayIcon,
          color: appColors.orderOnTheWayColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          appIcons.isDoneIcon,
          color: appColors.orderIsDoneColor,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (pageIndex != null) {
      _controller.index = pageIndex ?? 0;
    }
    return BaseScaffold(
        body: PersistentTabView(
          context,
          backgroundColor: Theme.of(context).colorScheme.surface,
          controller: _controller,
          screens: orderPages(),
          items: bottomNavBarItems(),
          navBarStyle: NavBarStyle.style3,
        ),);
  }
}
