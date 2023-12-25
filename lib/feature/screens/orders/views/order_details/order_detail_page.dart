import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/model/order_model.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

part 'order_total_price_field.dart';
part 'order_status_field.dart';
part 'order_createdtime_field.dart';
part 'order_id_field.dart';

final class OrderDetails extends StatefulWidget {
  const OrderDetails({required this.order, super.key});
  final OrderModel order;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

final class _OrderDetailsState extends State<OrderDetails> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.order_orderDetail.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                _OrderIdField(order: order),
                _OrderCreatedTimeField(order: order),
                _OrderStatusField(orderStatus: orderStatus),
                _OrderTotalPriceField(order: order),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
