part of 'order_detail_page.dart';

final class _OrderTotalPriceField extends StatelessWidget {
  const _OrderTotalPriceField({
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.mainText_totalPrice.tr()),
      trailing: SelectableText(
        '${order.totalPrice?.toStringAsFixed(2) ?? 0.0}',
        style: const TextStyle(fontSize: 14),
      ),
      style: ListTileStyle.drawer,
    );
  }
}
