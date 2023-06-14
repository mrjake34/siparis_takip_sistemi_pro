import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/size/sizes.dart';
import '../../../../../providers/search_providers.dart';
import '../../../../../src/text/autosize_text.dart';
import '../../../customer/bloc/customer_bloc.dart';
import '../../../../../core/init/translation/locale_keys.g.dart';
import '../../../../../core/init/utils/utils.dart';
import '../../../customer/model/customer.dart';
import '../../bloc/add_order_bloc/orders_bloc.dart';
import '../add_order.dart';

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
              List<Customer>? customerList = state.customerList?.customers
                  ?.where(
                      (element) => element.name.toString().toLowerCase().contains(context.watch<AddOrderAddCustomerSearchProvider>().getSearchValue))
                  .toList();
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: customerList?.length,
                itemBuilder: (context, index) {
                  Customer? customer = customerList?[index];
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
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {
                                try {
                                  // context
                                  //     .read<AddOrderAddCustomerProvider>()
                                  //     .setCustomer = customer ?? Customer();
                                  context.read<OrdersBloc>().add(AddOrderAddCustomerEvent(customer: customer));
                                } finally {
                                  UtilsService.instance.showSnackBar(LocaleKeys.succes_customerAdded.tr());
                                  Navigator.pushAndRemoveUntil(context, PageRouterAddOrder(), (route) => false);
                                }
                              },
                              icon: const Icon(Icons.add)),
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

  MaterialPageRoute<dynamic> PageRouterAddOrder() {
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
            initialValue: context.watch<AddOrderAddCustomerSearchProvider>().getSearchValue,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: InputBorder.none,
              suffixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {
              context.read<AddOrderAddCustomerSearchProvider>().setSearchValue = value.toLowerCase();
            },
          ),
        ),
      ],
    );
  }
}
