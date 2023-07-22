// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/components/main-functions.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/icons/icons.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/src/bottomsheets/main_bottom_sheets.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/bloc/add_order_bloc/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/model/order.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/order_lists/bottomsheet_widget/bottomsheet_widget.dart';

import '../../../../../src/cards/list_card.dart';

class OrderListAllOrders extends StatelessWidget with BaseModelView {
  OrderListAllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBuilder(mainFunctions: mainFunctions);
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required this.mainFunctions,
    super.key,
  });

  final MainFunctions mainFunctions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(
        buildWhen: (previous, current) => previous.orderList != current.orderList,
        builder: (context, state) {
          final orderList = state.orderList;
          orderList?.products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
          if (orderList?.products != null) {
            return ListView.builder(
              padding: const EdgeInsets.all(pagePadding),
              shrinkWrap: true,
              itemCount: orderList?.products.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final order = orderList?.products[index];
                final orderStatusText = mainFunctions.getStringFromOrderStatus(orderStatus: order?.orderStatus);
                final iconData = mainFunctions.getIconFromOrderStatus(orderStatus: order?.orderStatus);
                final color = mainFunctions.getColorFromOrderStatus(orderStatus: order?.orderStatus);
                return ListCard(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: CustomerField(order: order, iconData: iconData, color: color, orderStatusText: orderStatusText),
                      ),
                      Expanded(
                        flex: 2,
                        child: CardMoreButton(order: order),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (orderList?.products == null) {
            return Center(
              child: Text(LocaleKeys.errors_failedLoadData.tr()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}

class CardMoreButton extends StatelessWidget {
  const CardMoreButton({
    required this.order,
    super.key,
  });

  final OrderListProduct? order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MainBottomSheets().openBottomSheet(
          context,
          OrderListBottomSheetWidget(
            order: order,
          ),
        );
      },
      child: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.surface, child: Icon(AppIcons.instance.moreIcon)),
    );
  }
}

class CustomerField extends StatelessWidget {
  const CustomerField({
    required this.order,
    required this.iconData,
    required this.color,
    required this.orderStatusText,
    super.key,
  });
  final OrderListProduct? order;
  final IconData iconData;
  final Color color;
  final String orderStatusText;

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
                context.read<OrdersBloc>().add(ChooseAnOrder(order: order));
                NavigationService.instance.navigateToPage(path: NavigationConstants.orderDetailsPage);
              },
              leading: Icon(iconData, color: color),
              title: Text(customer?.name ?? ' '),
              subtitle: Text(orderStatusText),
            );
          },
        ),
      ],
    );
  }
}
