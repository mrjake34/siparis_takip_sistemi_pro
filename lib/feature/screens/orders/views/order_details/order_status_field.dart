part of 'order_detail_page.dart';

final class _OrderStatusField extends StatelessWidget {
  const _OrderStatusField({
    required this.orderStatus,
  });

  final OrderStatusEnum orderStatus;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.order_orderStatus.tr()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            orderStatus.icon,
            color: orderStatus.color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            orderStatus.localeKeys.tr(),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
      style: ListTileStyle.drawer,
    );
  }
}
