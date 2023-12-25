part of 'order_detail_page.dart';

final class _OrderIdField extends StatelessWidget {
  const _OrderIdField({
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.order_orderId.tr()),
      trailing: SelectableText(
        order.id ?? '',
        style: const TextStyle(fontSize: 14),
      ),
      style: ListTileStyle.drawer,
    );
  }
}
