import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/order_lists/order_list_all_orders.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/order_lists/order_list_completed_orders.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/order_lists/order_list_ontheway_orders.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/order_lists/order_list_pending_orders.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/order_lists/order_list_process_orders.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/icons/icons.dart';

@RoutePage()
class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key, this.pageIndex});
  final int? pageIndex;

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  final PersistentTabController _controller = PersistentTabController();

  List<Widget> orderPages() {
    return [
      OrderListAllOrders(),
      OrderListPendingOrders(),
      const OrderListProcessOrders(),
      OrderListOnTheWayOrders(),
      OrderListCompletedOrders(),
    ];
  }

  List<PersistentBottomNavBarItem> bottomNavBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          AppIcons.orderListIcon,
          color: AppColors.ordersColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          AppIcons.pendingIcon,
          color: AppColors.orderPendingColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          AppIcons.inProcessIcon,
          color: AppColors.orderInProcessColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          AppIcons.onTheWayIcon,
          color: AppColors.orderOnTheWayColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          AppIcons.isDoneIcon,
          color: AppColors.orderIsDoneColor,
        ),
      ),
    ];
  }

  @override
  void initState() {
    if (widget.pageIndex != null) {
      _controller.index = widget.pageIndex ?? 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: PersistentTabView(
        context,
        backgroundColor: Theme.of(context).colorScheme.surface,
        controller: _controller,
        screens: orderPages(),
        items: bottomNavBarItems(),
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}
