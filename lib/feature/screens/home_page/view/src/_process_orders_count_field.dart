part of '../home_page.dart';

final class _ProcessOrdersCountField extends StatelessWidget {
  const _ProcessOrdersCountField();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorName.orderInProcessColor,
      child: ListTile(
        style: ListTileStyle.list,
        title: CustomAutoSizeText(
          data: LocaleKeys.mainText_totalInProcessOrders.tr(),
          textColor: Colors.white,
        ),
        subtitle: BlocProvider(
          create: (context) => OrdersBloc(),
          child: BlocListener<OrdersBloc, OrdersState>(
            listener: (context, state) {
              if (state.status == Status.isDone) {
                context.read<OrdersBloc>().add(ProcessOrdersEvent());
              }
            },
            child: BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, state) {
                return CustomAutoSizeNumber(
                  data: '${state.processOrders?.length ?? 0}',
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
