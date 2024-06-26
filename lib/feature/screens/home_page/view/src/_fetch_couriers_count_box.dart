part of '../home_page.dart';

final class _FetchCouriersCountBox extends StatelessWidget {
  const _FetchCouriersCountBox();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: ColorName.couriersColor,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 110,
            ),
            child: ListTile(
              style: ListTileStyle.list,
              title: CustomAutoSizeText(
                data: LocaleKeys.mainText_totalCourier.tr(),
                textColor: Colors.white,
              ),
              subtitle: BlocProvider(
                create: (context) => CourierBloc(
                  ProductItems.courierService,
                )..add(const CourierEvent()),
                child: BlocBuilder<CourierBloc, CourierState>(
                  builder: (context, state) {
                    final courierList = state.courierList;
                    if (courierList == null) return const SizedBox();
                    return CustomAutoSizeNumber(
                      data: '${courierList.length}',
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
