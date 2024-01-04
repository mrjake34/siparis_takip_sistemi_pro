import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/service/courier_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/bloc/add_order/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/bloc/products_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/autosize_number.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/autosize_text.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../../product/service/product_service.dart';

part 'src/_done_orders_count_field.dart';
part 'src/_fetch_order_status_count.dart';
part 'src/_ontheway_orders_count_field.dart';
part 'src/_process_orders_count_field.dart';
part 'src/_pending_orders_count_field.dart';
part 'src/_fetch_product_count_box.dart';
part 'src/_fetch_orders_count_box.dart';
part 'src/_fetch_couriers_count_box.dart';
part 'src/_fetch_customers_count_box.dart';

@RoutePage()

/// This class is view a home page
class HomePage extends StatelessWidget {
  /// This is contructor method for the home page
  const HomePage({required this.userModel, super.key});

  /// This is the user model
  final User userModel;

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.pagePadding),
        child: Column(
          children: [
            Row(
              children: [
                _FetchCustomersCountBox(),
                _FetchCouriersCountBox(),
              ],
            ),
            Row(
              children: [
                _FetchOrdersCountBox(),
                _FetchProductsCountBox(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _FetchOrderStatusCount(),
          ],
        ),
      ),
    );
  }
}
