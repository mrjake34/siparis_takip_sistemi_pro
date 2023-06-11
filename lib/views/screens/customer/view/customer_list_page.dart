import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/bloc/customer_bloc.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../src/bottomsheets/main_bottom_sheets.dart';
import '../model/customer.dart';
import 'bottomsheet/customer_list_bottom_sheet.dart';
import 'customer_details.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({Key? key}) : super(key: key);

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
    super.key,
    required this.appColors,
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
    super.key,
    required this.appColors,
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
              Customer? customer = state.customerList?.customers[index];
              return Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomerListCardCustomerField(customer: customer),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomerListCardButtonField(
                          appColors: appColors, customer: customer),
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
    super.key,
    required this.customer,
  });

  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomerDetails(customerId: customer?.id),
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 0),
            child: Text(
              customer?.name ?? "",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(customer?.address ?? ""),
            subtitle: Text(customer?.phone ?? ""),
          ),
        ],
      ),
    );
  }
}

class CustomerListCardButtonField extends StatelessWidget {
  const CustomerListCardButtonField({
    super.key,
    required this.appColors,
    required this.customer,
  });

  final AppColors appColors;
  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MainBottomSheets().openBottomSheet(
              context,
              CustomerListBottomSheetWidget(
                  appColors: appColors, id: customer?.id));
        },
        child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: const Icon(Icons.more_vert)));
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
