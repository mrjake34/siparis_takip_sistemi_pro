import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/bloc/add_order/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/model/order_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/icons/icons.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/list_card.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/failed_load_data_text.dart';

class OrderListProcessOrders extends StatelessWidget {
  const OrderListProcessOrders({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          final List<OrderModel?>? orderList = state.processOrders;
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
              return const ListCard(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text('Customer'),
                    ),
                    Expanded(
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

class CardMoreButton extends StatelessWidget {
  const CardMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: const Icon(
          AppIcons.moreIcon,
        ),
      ),
    );
  }
}
