import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/bloc/login_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/failed_load_data_text.dart';

import '../../../../../product/core/constants/colors/colors.dart';
import '../../../../../product/core/constants/enums/enums.dart';
import '../../../../../product/src/cards/cards_more_button.dart';
import '../../../../../product/src/cards/list_card.dart';
import '../../bloc/customer_bloc.dart';
import '../../model/customer.dart';

@RoutePage()
class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      body: Column(
        children: [
          LinearField(),
          Flexible(
            child: CustomerListBuilder(),
          ),
        ],
      ),
    );
  }
}

class CustomerListBuilder extends StatelessWidget {
  const CustomerListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerBloc, CustomerState>(
      builder: (context, state) {
        final List<Customer?>? customerList = state.customerList?.customers;
        if (customerList == null) return const FailedLoadDataText();
        return ListView.builder(
          itemCount: customerList.length,
          itemBuilder: (BuildContext context, int index) {
            final customer = customerList[index];
            if (customer == null) return const SizedBox();
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
                        CardMoreButton.openMenu<void>(
                          context: context,
                          id: customer.id ?? '',
                          function: () => context.read<CustomerBloc>().add(
                                CustomerDeleteEvent(
                                  id: customer.id ?? '',
                                  cookie:
                                      context.read<LoginBloc>().state.cookie,
                                ),
                              ),
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
      onTap: () {},
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
          return const LinearProgressIndicator(
            color: AppColors.alternativeButtonColor,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
