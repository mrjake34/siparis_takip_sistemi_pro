import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base/models/base_model_view.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/constants/size/sizes.dart';
import '../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../src/cards/cards_more_button.dart';
import '../../../../src/cards/list_card.dart';
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

class _CustomerListPageState extends State<CustomerListPage> with BaseModelView {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.customer_customerList.tr()),
      ),
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
                      child: CustomerListCardButtonField(
                        appColors: appColors,
                        customer: customer,
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

class CustomerListCardButtonField extends StatelessWidget {
  const CustomerListCardButtonField({
    required this.appColors,
    required this.customer,
    super.key,
  });

  final AppColors appColors;
  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return CardMoreButtonField(
      removeFunction: () {
        CustomerService().deleteCustomer(customer?.id ?? '');
      },
      id: customer?.id,
      routerWidget: EditCustomer(id: customer?.id ?? ''),
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
