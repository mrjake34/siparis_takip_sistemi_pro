part of '../home_page.dart';

final class _DoneOrdersCountField extends StatelessWidget {
  const _DoneOrdersCountField();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorName.orderIsDoneColor,
      child: ListTile(
        style: ListTileStyle.list,
        title: CustomAutoSizeText(
          data: LocaleKeys.mainText_totalIsDoneOrders.tr(),
          textColor: Colors.white,
        ),
        subtitle: BlocProvider(
          create: (context) => OrdersBloc(),
          child: BlocListener<OrdersBloc, OrdersState>(
            listener: (context, state) {
              if (state.status == Status.isDone) {
                context.read<OrdersBloc>().add(DoneOrdersEvent());
              }
            },
            child: BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, state) {
                final doneOrders = state.doneOrders;
                if (doneOrders == null) return const SizedBox();
                return CustomAutoSizeNumber(
                  data: '${doneOrders.length}',
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
