// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/product/src/maps/flutter_map.dart';
import 'package:siparis_takip_sistemi_pro/product/src/maps/google_map.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/model/customer.dart';

class CustomerDetails extends StatelessWidget with BaseModelView {
  CustomerDetails({
    required this.customerId,
    super.key,
  });
  final String? customerId;

  @override
  Widget build(BuildContext context) {
    return PageBuilder(customerId: customerId);
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required this.customerId,
    super.key,
  });

  final String? customerId;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state.customerList != null) {
            final customer = state.customerList?.customers
                .firstWhere((element) => element.id == customerId);
            final createdTime = customer?.createdAt;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(pagePadding),
              child: Column(
                children: [
                  CustomerDetailCardCustomerName(customer: customer),
                  CustomerDetailCardCustomerAddress(customer: customer),
                  CustomerDetailCardCustomerPhone(customer: customer),
                  CustomerDetailCardCustomerCreatedTime(
                    createdTime: createdTime,
                  ),
                  CustomerDetailCardCustomerLocation(customer: customer),
                ],
              ),
            );
          } else if (state.customerList == null) {
            return Center(
              child: Text(LocaleKeys.errors_failedLoadData.tr()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}

class CustomerDetailCardCustomerLocation extends StatelessWidget {
  const CustomerDetailCardCustomerLocation({
    required this.customer,
    super.key,
  });

  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ListTile(
              isThreeLine: true,
              title: Text(LocaleKeys.customer_customerLocation.tr()),
              subtitle: SelectableText(
                '${customer?.longitude ?? 0.0} ${customer?.latitude ?? 0.0}',
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (Platform.isWindows) {
                  Navigator.push(
                    context,
                    pageRouterFlutterMapPage(),
                  );
                } else {
                  Navigator.push(
                    context,
                    pageRouterGoogleMapPage(),
                  );
                }
              },
              child: Column(
                children: [
                  const Icon(Icons.map),
                  Text(LocaleKeys.mainText_showOnMap.tr()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  MaterialPageRoute<dynamic> pageRouterFlutterMapPage() {
    return MaterialPageRoute(
      builder: (context) => FlutterMapPage(
        mapLat: customer?.latitude ?? 0.0,
        mapLng: customer?.longitude ?? 0.0,
      ),
    );
  }

  MaterialPageRoute<dynamic> pageRouterGoogleMapPage() {
    return MaterialPageRoute(
      builder: (context) => GoogleMapPage(
        mapLat: customer?.latitude ?? 0.0,
        mapLong: customer?.longitude ?? 0.0,
      ),
    );
  }
}

class CustomerDetailCardCustomerCreatedTime extends StatelessWidget {
  const CustomerDetailCardCustomerCreatedTime({
    required this.createdTime,
    super.key,
  });

  final DateTime? createdTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(LocaleKeys.mainText_createdTime.tr()),
        subtitle: Text(
          DateFormat('yyyy/MM/dd').format(createdTime ?? DateTime.now()),
        ),
      ),
    );
  }
}

class CustomerDetailCardCustomerPhone extends StatelessWidget {
  const CustomerDetailCardCustomerPhone({
    required this.customer,
    super.key,
  });

  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(LocaleKeys.customer_customerPhone.tr()),
        subtitle: SelectableText(customer?.phone ?? ''),
      ),
    );
  }
}

class CustomerDetailCardCustomerAddress extends StatelessWidget {
  const CustomerDetailCardCustomerAddress({
    required this.customer,
    super.key,
  });

  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(LocaleKeys.customer_customerAddress.tr()),
        subtitle: SelectableText(customer?.adress ?? ''),
      ),
    );
  }
}

class CustomerDetailCardCustomerName extends StatelessWidget {
  const CustomerDetailCardCustomerName({
    required this.customer,
    super.key,
  });

  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(LocaleKeys.customer_customerName.tr()),
        subtitle: Text(customer?.name ?? ''),
      ),
    );
  }
}
