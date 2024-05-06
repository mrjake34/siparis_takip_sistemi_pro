part of '../home_page.dart';

final class _OnTheWayOrdersCountField extends StatelessWidget {
  const _OnTheWayOrdersCountField();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorName.orderOnTheWayColor,
      child: ListTile(
        style: ListTileStyle.list,
        title: CustomAutoSizeText(
          data: LocaleKeys.mainText_totalOnTheWayOrders.tr(),
          textColor: Colors.white,
        ),
        subtitle: BlocProvider(
          create: (context) => OrdersBloc(ProductItems.orderService),
          child: BlocListener<OrdersBloc, OrdersState>(
            listener: (context, state) {
              if (state.status == Status.isDone) {
                context.read<OrdersBloc>().add(OnTheWayOrdersEvent());
              }
            },
            child: BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, state) {
                final onTheWayOrders = state.onTheWayOrders;
                if (onTheWayOrders == null) return const SizedBox();
                return CustomAutoSizeNumber(
                  data: '${onTheWayOrders.length}',
                  textColor: Colors.white,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
