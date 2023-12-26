import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/model/order_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';

import '../../../../../product/utils/translations/locale_keys.g.dart';

/// This page is not done yet.
/// This page will be used to edit the order.
/// ListTile widgets will change to TextFormField widgets.
/// The user will be able to edit the order.
@RoutePage()
class EditOrderPage extends StatefulWidget {
  const EditOrderPage({required this.order, super.key});
  final OrderModel order;

  @override
  State<EditOrderPage> createState() => _EditOrderPageState();
}

class _EditOrderPageState extends State<EditOrderPage> {
  late final OrderModel order;
  late final OrderStatusEnum orderStatus;

  @override
  void initState() {
    order = widget.order;
    orderStatus = OrderStatusEnum.getStatusValueFromOrderStatus(
      orderStatus: widget.order.orderStatus,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(LocaleKeys.order_orderId.tr()),
                    subtitle: SelectableText(order.id ?? ''),
                    style: ListTileStyle.drawer,
                  ),
                  ListTile(
                    title: Text(LocaleKeys.order_orderTime.tr()),
                    subtitle: Text(
                      DateFormat('yyyy/MM/dd - HH:mm ')
                          .format(order.createdAt ?? DateTime.now()),
                    ),
                    style: ListTileStyle.drawer,
                  ),
                  ListTile(
                    title: Text(LocaleKeys.order_orderStatus.tr()),
                    subtitle: Row(
                      children: [
                        Icon(
                          orderStatus.icon,
                          color: orderStatus.color,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          orderStatus.localeKeys.tr(),
                        ),
                      ],
                    ),
                    style: ListTileStyle.drawer,
                  ),
                  ListTile(
                    title: Text(LocaleKeys.mainText_totalPrice.tr()),
                    subtitle: SelectableText(
                      order.totalPrice?.toStringAsFixed(2) ?? '',
                    ),
                    style: ListTileStyle.drawer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
