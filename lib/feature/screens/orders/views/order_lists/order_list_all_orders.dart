import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/bloc/add_order/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/model/order_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/icons/icons.dart';

import '../../../../../product/src/cards/list_card.dart';
import '../../../../../product/src/text/failed_load_data_text.dart';

class OrderListAllOrders extends StatelessWidget {
  const OrderListAllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          final List<OrderModel?>? orderList = state.orderList;
          if (orderList == null) return const FailedLoadDataText();
          orderList.sort((a, b) {
            if (a?.createdAt == null ||
                b?.createdAt == null ||
                a == null ||
                b == null) {
              return 0;
            }
            return b.createdAt!.compareTo(a.createdAt!);
          });

          return ListView.builder(
            shrinkWrap: true,
            itemCount: orderList.length,
            itemBuilder: (BuildContext context, int index) {
              final order = orderList[index];
              if (order == null) return const SizedBox();
              return ListCard(
                child: Row(
                  children: [
                    const Expanded(
                      flex: 5,
                      child: Text('Customer'),
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

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: const Icon(AppIcons.moreIcon),
      ),
    );
  }
}
