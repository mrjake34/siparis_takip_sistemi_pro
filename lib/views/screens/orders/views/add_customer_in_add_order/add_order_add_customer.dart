import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/core/init/utils/utils.dart';
import 'package:siparis_takip_sistemi_pro/providers/search_providers.dart';
import 'package:siparis_takip_sistemi_pro/src/text/autosize_text.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/bloc/add_order_bloc/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/add_order.dart';

class AddOrderAddCustomer extends StatefulWidget {
  const AddOrderAddCustomer({super.key});

  @override
  State<AddOrderAddCustomer> createState() => _AddOrderAddCustomerState();
}

class _AddOrderAddCustomerState extends State<AddOrderAddCustomer> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(pagePadding),
      child: Column(
        children: [
          SearchBarAndTitle(),
          Flexible(child: CustomerListField()),
        ],
      ),
    );
  }
}

class CustomerListField extends StatelessWidget {
  const CustomerListField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<CustomerBloc, CustomerState>(
            builder: (context, state) {
              final customerList = state.customerList?.customers
                  .where((element) => element.name
                      .toString()
                      .toLowerCase()
                      .contains(context
                          .watch<AddOrderAddCustomerSearchProvider>()
                          .getSearchValue,),)
                  .toList();
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: customerList?.length,
                itemBuilder: (context, index) {
                  final customer = customerList?[index];
                  return Card(
                    color: Theme.of(context).colorScheme.surface,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 10,),
                                child: Text(
                                  customer?.name ?? '',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,),
                                ),
                              ),
                              ListTile(
                                title: Text(customer?.adress ?? ''),
                                subtitle: Text(customer?.phone ?? ''),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                try {
                                  // context
                                  //     .read<AddOrderAddCustomerProvider>()
                                  //     .setCustomer = customer ?? Customer();
                                  context.read<OrdersBloc>().add(
                                      AddOrderAddCustomerEvent(
                                          customer: customer,),);
                                } finally {
                                  UtilsService.instance.showSnackBar(
                                      LocaleKeys.succes_customerAdded.tr(),);
                                  Navigator.pushAndRemoveUntil(context,
                                      pageRouterAddOrder(), (route) => false,);
                                }
                              },
                              icon: const Icon(Icons.add),),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }

  MaterialPageRoute<dynamic> pageRouterAddOrder() {
    return MaterialPageRoute(builder: (context) => const AddOrder());
  }
}

class SearchBarAndTitle extends StatelessWidget {
  const SearchBarAndTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAutoSizeText(
          data: LocaleKeys.customer_addCustomer.tr(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: TextFormField(
            initialValue: context
                .watch<AddOrderAddCustomerSearchProvider>()
                .getSearchValue,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: InputBorder.none,
              suffixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {
              context.read<AddOrderAddCustomerSearchProvider>().setSearchValue =
                  value.toLowerCase();
            },
          ),
        ),
      ],
    );
  }
}
