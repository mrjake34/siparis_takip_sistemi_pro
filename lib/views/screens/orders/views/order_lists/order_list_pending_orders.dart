// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/src/bottomsheets/main_bottom_sheets.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/bloc/add_order_bloc/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/order_lists/bottomsheet_widget/bottomsheet_widget.dart';
import '../../../../../core/base/models/base_model_view.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/init/navigation/navigation_service.dart';
import '../../../customer/model/customer.dart';
import '../../model/order.dart';

class OrderListPendingOrders extends StatelessWidget with BaseModelView {
  OrderListPendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(
        buildWhen: (previous, current) =>
            previous.pendingOrders != current.pendingOrders,
        builder: (context, state) {
          state.pendingOrders
              ?.sort((a, b) => b.createdAt.compareTo(a.createdAt));
          return ListView.builder(
            padding: const EdgeInsets.all(pagePadding),
            shrinkWrap: true,
            itemCount: state.pendingOrders?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              Order? order = state.pendingOrders?[index];
              Text orderStatus = mainFunctions.getTextFromOrderStatus(
                  orderStatus: order?.orderStatus);
              IconData iconData = mainFunctions.getIconFromOrderStatus(
                  orderStatus: order?.orderStatus);
              Color color = mainFunctions.getColorFromOrderStatus(
                  orderStatus: order?.orderStatus);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: color,
                      ),
                      borderRadius: BorderRadius.circular(5.0)),
                  color: Theme.of(context).colorScheme.surface,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomerField(
                            order: order,
                            iconData: iconData,
                            color: color,
                            orderStatus: orderStatus),
                      ),
                      const Expanded(
                        flex: 1,
                        child: CardMoreButton(),
                      ),
                    ],
                  ),
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
    super.key,
    required this.order,
    required this.iconData,
    required this.color,
    required this.orderStatus,
  });

  final Order? order;
  final IconData iconData;
  final Color color;
  final Text orderStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<CustomerBloc, CustomerState>(
          buildWhen: (previous, current) =>
              previous.customerList != current.customerList,
          builder: (context, state) {
            Customer? customer = state.customerList?.customers
                .firstWhere((element) => element.id == order?.customerId);
            return ListTile(
              onTap: () {
                  
                NavigationService.instance.navigateToPage(
                    path: NavigationConstants.orderDetailsPage,
                    object: order?.id);
              },
              leading: Icon(iconData, color: color),
              title: Text(customer?.name ?? " "),
              subtitle: orderStatus,
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
        MainBottomSheets()
            .openBottomSheet(context, OrderListBottomSheetWidget());
      },
      child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: const Icon(Icons.more_vert)),
    );
  }
}
