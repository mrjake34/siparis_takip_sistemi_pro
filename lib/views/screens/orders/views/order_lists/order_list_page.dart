import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';

import '../../../../../core/init/translation/locale_keys.g.dart';
import 'order_list_all_orders.dart';
import 'order_list_completed_orders.dart';
import 'order_list_ontheway_orders.dart';
import 'order_list_pending_orders.dart';
import 'order_list_process_orders.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> with BaseModelView {
  int pageIndex = 0;
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  void changePage(int index) {
    if (mounted) {
      setState(() {
        pageIndex = index;
      });
    }
  }

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
          appConstats.orderListIcon,
          color: AppColors.instance.ordersColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          appConstats.pendingIcon,
          color: AppColors.instance.orderPendingColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          appConstats.inProcessIcon,
          color: AppColors.instance.orderInProcessColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          appConstats.onTheWayIcon,
          color: AppColors.instance.orderOnTheWayColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          appConstats.isDoneIcon,
          color: AppColors.instance.orderIsDoneColor,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.order_orderList.tr(),
          ),
        ),
        body: PersistentTabView(
          context,
          backgroundColor: Theme.of(context).colorScheme.surface,
          controller: _controller,
          screens: orderPages(),
          items: bottomNavBarItems(),
          navBarStyle: NavBarStyle.style3,
        ));
  }
}
