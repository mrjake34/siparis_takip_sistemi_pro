import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/model/customer.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/failed_load_data_text.dart';
import '../../../../../product/src/cards/list_card.dart';
import '../../../../../product/src/text/autosize_text.dart';
import '../../../../../product/utils/translations/locale_keys.g.dart';

final class AddOrderAddCustomer extends StatefulWidget {
  const AddOrderAddCustomer({super.key});

  @override
  State<AddOrderAddCustomer> createState() => _AddOrderAddCustomerState();
}

final class _AddOrderAddCustomerState extends State<AddOrderAddCustomer> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchBarAndTitle(),
        Flexible(child: CustomerListField()),
      ],
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
              final customerList = state.customerList?.customers;
              if (customerList == null) return const FailedLoadDataText();
              return _ListViewBuilder(customerList: customerList);
            },
          ),
        ],
      ),
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder({
    required this.customerList,
  });

  final List<Customer?> customerList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: customerList.length,
      itemBuilder: (context, index) {
        final customer = customerList[index];
        if (customer == null) return const SizedBox();
        return ListCard(
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
                        left: 15,
                        top: 10,
                      ),
                      child: Text(
                        customer.name ?? '',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(customer.adress ?? ''),
                      subtitle: Text(customer.phone ?? ''),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final class SearchBarAndTitle extends StatelessWidget {
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
            initialValue: '',
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: InputBorder.none,
              suffixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
