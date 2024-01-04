part of '../home_page.dart';

final class _FetchOrdersCountBox extends StatelessWidget {
  const _FetchOrdersCountBox();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: AppColors.ordersColor,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 110,
            ),
            child: ListTile(
              style: ListTileStyle.list,
              title: CustomAutoSizeText(
                data: LocaleKeys.mainText_totalOrder.tr(),
                textColor: Colors.white,
              ),
              subtitle: BlocProvider(
                create: (context) => OrdersBloc()..add(OrdersListEvent()),
                child: BlocBuilder<OrdersBloc, OrdersState>(
                  builder: (context, state) {
                    final orderList = state.orderList;
                    if (orderList == null) return const SizedBox();
                    return CustomAutoSizeNumber(
                      data: '${orderList.length}',
                      textColor: Colors.white,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
