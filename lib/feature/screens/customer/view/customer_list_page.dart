import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/src/dialogs/show_dialog.dart';
import '../../../../product/core/base/models/base_model_view.dart';
import '../../../../product/core/constants/colors/colors.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/core/constants/navigation/navigation_constants.dart';
import '../../../../product/core/constants/size/sizes.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../../../../product/src/cards/cards_more_button.dart';
import '../../../../product/src/cards/list_card.dart';
import '../bloc/customer_bloc.dart';
import '../model/customer.dart';
import '../service/customer_service.dart';
import 'customer_details.dart';
import 'edit_customer.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage>
    with BaseModelView {
  @override
  Widget build(BuildContext context) {
    return PageBuilder(appColors: appColors);
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required this.appColors,
    super.key,
  });

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const LinearField(),
          Flexible(
            child: CustomerListBuilder(appColors: appColors),
          ),
        ],
      ),
    );
  }
}

class CustomerListBuilder extends StatelessWidget {
  const CustomerListBuilder({
    required this.appColors,
    super.key,
  });

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerBloc, CustomerState>(
      builder: (context, state) {
        if (state.customerList?.customers != null) {
          return ListView.builder(
            padding: const EdgeInsets.all(pagePadding),
            itemCount: state.customerList?.customers.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final customer = state.customerList?.customers[index];
              return ListCard(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomerListCardCustomerField(customer: customer),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTapDown: (details) {
                          CardMoreButton.openMenu(
                            context: context,
                            path: NavigationConstants.customerEditPage,
                            id: customer?.id ?? '',
                            function: () => CustomerService()
                                .deleteCustomer(customer?.id ?? ''),
                            offset: details.globalPosition,
                          );
                        },
                        child: const Icon(
                          Icons.more_vert,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state.customerList?.customers == null) {
          return Center(
            child: Text(LocaleKeys.mainText_listEmpty.tr()),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}

class CustomerListCardCustomerField extends StatelessWidget {
  const CustomerListCardCustomerField({
    required this.customer,
    super.key,
  });

  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          pageRouterCustomerDetailPage(),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              customer?.name ?? '',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(customer?.adress ?? ''),
            subtitle: Text(customer?.phone ?? ''),
          ),
        ],
      ),
    );
  }

  MaterialPageRoute<dynamic> pageRouterCustomerDetailPage() {
    return MaterialPageRoute(
      builder: (context) => CustomerDetails(customerId: customer?.id),
    );
  }
}

class LinearField extends StatelessWidget {
  const LinearField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerBloc, CustomerState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.isLoading) {
          return LinearProgressIndicator(
            color: AppColors.instance.alternativeButtonColor,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
