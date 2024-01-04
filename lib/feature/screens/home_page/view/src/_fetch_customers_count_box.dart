part of '../home_page.dart';

final class _FetchCustomersCountBox extends StatelessWidget {
  const _FetchCustomersCountBox();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: AppColors.customersColor,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 110,
            ),
            child: ListTile(
              style: ListTileStyle.list,
              title: CustomAutoSizeText(
                data: LocaleKeys.mainText_totalCustomer.tr(),
                textColor: Colors.white,
              ),
              subtitle: BlocProvider(
                create: (context) =>
                    CustomerBloc()..add(FetchCustomerListEvent()),
                child: BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    final customerList = state.customerList?.customers;
                    if (customerList == null) return const SizedBox();
                    return CustomAutoSizeNumber(
                      data: '${customerList.length}',
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
