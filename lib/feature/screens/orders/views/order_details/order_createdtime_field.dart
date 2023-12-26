part of 'order_detail_page.dart';

final class _OrderCreatedTimeField extends StatelessWidget {
  const _OrderCreatedTimeField({
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.order_orderTime.tr()),
      trailing: Text(
        DateFormat('yyyy/MM/dd - HH:mm ')
            .format(order.createdAt ?? DateTime.now()),
        style: const TextStyle(fontSize: 14),
      ),
      style: ListTileStyle.drawer,
    );
  }
}
