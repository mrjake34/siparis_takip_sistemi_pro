// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/icons/icons.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/singletons/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/src/bottomsheets/main_bottom_sheets.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/bloc/add_order_bloc/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/model/order.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/order_lists/bottomsheet_widget/bottomsheet_widget.dart';

import '../../../../../src/cards/list_card.dart';

class OrderListOnTheWayOrders extends StatelessWidget with BaseModelView {
  OrderListOnTheWayOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(
        buildWhen: (previous, current) => previous.onTheWayOrders != current.onTheWayOrders,
        builder: (context, state) {
          state.onTheWayOrders?.sort((a, b) => b.createdAt.compareTo(a.createdAt));
          return ListView.builder(
            padding: const EdgeInsets.all(pagePadding),
            shrinkWrap: true,
            itemCount: state.onTheWayOrders?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final order = state.onTheWayOrders?[index];
              final orderStatus = mainFunctions.getStringFromOrderStatus(
                orderStatus: order?.orderStatus,
              );
              final iconData = mainFunctions.getIconFromOrderStatus(
                orderStatus: order?.orderStatus,
              );
              final color = mainFunctions.getColorFromOrderStatus(
                orderStatus: order?.orderStatus,
              );
              return ListCard(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomerField(
                        order: order,
                        iconData: iconData,
                        color: color,
                        orderStatus: orderStatus,
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: CardMoreButton(),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomerField extends StatelessWidget {
  const CustomerField({
    required this.order,
    required this.iconData,
    required this.color,
    required this.orderStatus,
    super.key,
  });

  final OrderListProduct? order;
  final IconData iconData;
  final Color color;
  final String orderStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<CustomerBloc, CustomerState>(
          buildWhen: (previous, current) => previous.customerList != current.customerList,
          builder: (context, state) {
            final customer = state.customerList?.customers.firstWhere((element) => element.id == order?.customerId);
            return ListTile(
              onTap: () {
                NavigationService.instance.navigateToPage(
                  path: NavigationConstants.orderDetailsPage,
                  object: order?.id,
                );
              },
              leading: Icon(iconData, color: color),
              title: Text(customer?.name ?? ' '),
              subtitle: Text(orderStatus),
            );
          },
        ),
      ],
    );
  }
}

class CardMoreButton extends StatelessWidget {
  const CardMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MainBottomSheets().openBottomSheet(context, OrderListBottomSheetWidget());
      },
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(AppIcons.instance.moreIcon),
      ),
    );
  }
}
