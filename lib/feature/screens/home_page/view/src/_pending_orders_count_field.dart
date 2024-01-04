part of '../home_page.dart';

final class _PendingOrdersCountField extends StatelessWidget {
  const _PendingOrdersCountField();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.orderPendingColor,
      child: ListTile(
        style: ListTileStyle.list,
        title: CustomAutoSizeText(
          data: LocaleKeys.mainText_totalPendingOrders.tr(),
          textColor: Colors.white,
        ),
        subtitle: BlocProvider(
          create: (context) => OrdersBloc(),
          child: BlocListener<OrdersBloc, OrdersState>(
            listener: (context, state) {
              if (state.status == Status.isDone) {
                context.read<OrdersBloc>().add(PendingOrdersEvent());
              }
            },
            child: BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, state) {
                return CustomAutoSizeNumber(
                  data: '${state.pendingOrders?.length ?? 0}',
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
