// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/components/main-functions.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/app/app_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/src/bottomsheets/main_bottom_sheets.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/order_lists/bottomsheet_widget/bottomsheet_widget.dart';
import '../../../../../core/base/models/base_model_view.dart';
import '../../bloc/add_order_bloc/orders_bloc.dart';
import '../../model/order.dart';
import '../../../customer/model/customer.dart';

class OrderListAllOrders extends StatelessWidget with BaseModelView {
  OrderListAllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBuilder(mainFunctions: mainFunctions);
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    super.key,
    required this.mainFunctions,
  });

  final MainFunctions mainFunctions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(
        buildWhen: (previous, current) =>
            previous.orderList != current.orderList,
        builder: (context, state) {
          OrderList? orderList = state.orderList;
          orderList?.order?.sort((a, b) => b.createdAt.compareTo(a.createdAt));
          if (orderList?.order?.isNotEmpty == true) {
            return ListView.builder(
              padding: const EdgeInsets.all(pagePadding),
              shrinkWrap: true,
              itemCount: orderList?.order?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                Order? order = orderList?.order?[index];
                Text orderStatusText = mainFunctions.getTextFromOrderStatus(
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
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomerField(
                              order: order,
                              iconData: iconData,
                              color: color,
                              orderStatusText: orderStatusText),
                        ),
                        Expanded(
                          flex: 2,
                          child: CardMoreButton(order: order),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (orderList?.order?.isEmpty == true) {
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
    super.key,
    required this.order,
  });

  final Order? order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MainBottomSheets().openBottomSheet(
            context,
            OrderListBottomSheetWidget(
              order: order,
            ));
      },
      child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Icon(AppConstats.instance.moreIcon)),
    );
  }
}

class CustomerField extends StatelessWidget {
  const CustomerField({
    super.key,
    required this.order,
    required this.iconData,
    required this.color,
    required this.orderStatusText,
  });
  final Order? order;
  final IconData iconData;
  final Color color;
  final Text orderStatusText;

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
                context.read<OrdersBloc>().add(ChooseAnOrder(order: order));
                NavigationService.instance
                    .navigateToPage(path: NavigationConstants.orderDetailsPage);
              },
              leading: Icon(iconData, color: color),
              title: Text(customer?.name ?? " "),
              subtitle: orderStatusText,
            );
          },
        ),
      ],
    );
  }
}
