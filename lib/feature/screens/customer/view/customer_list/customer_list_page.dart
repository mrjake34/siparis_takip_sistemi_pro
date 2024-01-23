import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/bloc/login_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/failed_load_data_text.dart';
import '../../../../../product/src/cards/cards_more_button.dart';
import '../../../../../product/src/cards/list_card.dart';
import '../../bloc/customer_bloc.dart';
import '../../model/customer_model.dart';

part 'src/_customer_list_card_customer_field.dart';
part 'src/_card_more_button.dart';
part 'src/_list_builder.dart';

@RoutePage()
class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          final List<CustomerModel?>? customerList =
              state.customerList?.customers;
          if (customerList == null) return const FailedLoadDataText();
          return _ListBuilder(customerList: customerList);
        },
      ),
    );
  }
}
