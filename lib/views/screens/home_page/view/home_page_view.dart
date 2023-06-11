// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/bloc/products_bloc.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/constants/size/sizes.dart';
import '../../../../src/text/autosize_text.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../core/init/translation/locale_keys.g.dart';
import '../../../../src/components/drawer.dart';
import '../../../../src/text/autosize_number.dart';
import '../../courier/bloc/courier_bloc.dart';
import '../../customer/bloc/customer_bloc.dart';
import '../../orders/bloc/add_order_bloc/orders_bloc.dart';

class HomePageView extends StatelessWidget with BaseModelView {
  final String userRole;
  HomePageView({Key? key, required this.userRole}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildPage(
      userRole: userRole,
      appColors: appColors,
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({super.key, this.userRole, required this.appColors});
  final String? userRole;
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_title.tr()),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                NavigationService.instance
                    .navigateToPage(path: NavigationConstants.userProfile);
              },
              icon: const Icon(CupertinoIcons.profile_circled))
        ],
      ),
      drawer: DrawerWidget(userRole: userRole ?? ""),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(pagePadding),
        child: Column(
          children: [
            Row(
              children: [
                FetchCustomersCountBox(
                  appColors: appColors,
                ),
                FetchCouriersCountBox(
                  appColors: appColors,
                ),
              ],
            ),
            Row(
              children: [
                FetchOrdersCountBox(
                  appColors: appColors,
                ),
                FetchProductsCountBox(
                  appColors: appColors,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FetchOrderStatusCount(
              appColors: appColors,
            ),
          ],
        ),
      ),
    );
  }
}

class FetchOrderStatusCount extends StatelessWidget {
  const FetchOrderStatusCount({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        PendingOrdersCountField(
          appColors: appColors,
        ),
        const SizedBox(
          height: 10,
        ),
        ProcessOrdersCountField(
          appColors: appColors,
        ),
        const SizedBox(
          height: 10,
        ),
        OnTheWayOrdersCountField(
          appColors: appColors,
        ),
        const SizedBox(
          height: 10,
        ),
        DoneOrdersCountField(
          appColors: appColors,
        ),
      ],
    );
  }
}

class DoneOrdersCountField extends StatelessWidget {
  const DoneOrdersCountField({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appColors.orderIsDoneColor,
      child: ListTile(
        style: ListTileStyle.list,
        title: CustomAutoSizeText(
          data: LocaleKeys.mainText_totalIsDoneOrders.tr(),
          textColor: Colors.white,
        ),
        subtitle: BlocListener<OrdersBloc, OrdersState>(
          listener: (context, state) {
            if (state.status == Status.isDone) {
              context.read<OrdersBloc>().add(DoneOrdersEvent());
            }
          },
          child: BlocBuilder<OrdersBloc, OrdersState>(
            builder: (context, state) {
              return CustomAutoSizeNumber(
                data: "${state.doneOrders?.length ?? 0}",
                textColor: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}

class OnTheWayOrdersCountField extends StatelessWidget {
  const OnTheWayOrdersCountField({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appColors.orderOnTheWayColor,
      child: ListTile(
        style: ListTileStyle.list,
        title: CustomAutoSizeText(
          data: LocaleKeys.mainText_totalOnTheWayOrders.tr(),
          textColor: Colors.white,
        ),
        subtitle: BlocListener<OrdersBloc, OrdersState>(
          listener: (context, state) {
            if (state.status == Status.isDone) {
              context.read<OrdersBloc>().add(OnTheWayOrdersEvent());
            }
          },
          child: BlocBuilder<OrdersBloc, OrdersState>(
            builder: (context, state) {
              return CustomAutoSizeNumber(
                data: "${state.onTheWayOrders?.length ?? 0}",
                textColor: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProcessOrdersCountField extends StatelessWidget {
  const ProcessOrdersCountField({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appColors.orderInProcessColor,
      child: ListTile(
        style: ListTileStyle.list,
        title: CustomAutoSizeText(
          data: LocaleKeys.mainText_totalInProcessOrders.tr(),
          textColor: Colors.white,
        ),
        subtitle: BlocListener<OrdersBloc, OrdersState>(
          listener: (context, state) {
            if (state.status == Status.isDone) {
              context.read<OrdersBloc>().add(ProcessOrdersEvent());
            }
          },
          child: BlocBuilder<OrdersBloc, OrdersState>(
            builder: (context, state) {
              return CustomAutoSizeNumber(
                data: "${state.processOrders?.length ?? 0}",
                textColor: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}

class PendingOrdersCountField extends StatelessWidget {
  const PendingOrdersCountField({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appColors.orderPendingColor,
      child: ListTile(
        style: ListTileStyle.list,
        title: CustomAutoSizeText(
          data: LocaleKeys.mainText_totalPendingOrders.tr(),
          textColor: Colors.white,
        ),
        subtitle: BlocListener<OrdersBloc, OrdersState>(
          listener: (context, state) {
            if (state.status == Status.isDone) {
              context.read<OrdersBloc>().add(PendingOrdersEvent());
            }
          },
          child: BlocBuilder<OrdersBloc, OrdersState>(
            builder: (context, state) {
              return CustomAutoSizeNumber(
                data: "${state.pendingOrders?.length ?? 0}",
                textColor: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}

class FetchProductsCountBox extends StatelessWidget {
  const FetchProductsCountBox({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(const ProductListEvent());
    return Flexible(
        child: GestureDetector(
      onTap: () {
        NavigationService.instance
            .navigateToPage(path: NavigationConstants.productListPage);
      },
      child: Card(
        color: appColors.productsColor,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 110,
          ),
          child: ListTile(
            style: ListTileStyle.list,
            title: CustomAutoSizeText(
              data: LocaleKeys.mainText_totalProducts.tr(),
              textColor: Colors.white,
            ),
            subtitle: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                return CustomAutoSizeNumber(
                  data: "${state.productList?.products.length ?? 0}",
                  textColor: Colors.white,
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}

class FetchOrdersCountBox extends StatelessWidget {
  const FetchOrdersCountBox({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    context.read<OrdersBloc>().add(OrdersListEvent());
    return Flexible(
        child: GestureDetector(
      onTap: () {
        NavigationService.instance
            .navigateToPage(path: NavigationConstants.orderListPage);
      },
      child: Card(
        color: appColors.ordersColor,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 110,
          ),
          child: ListTile(
            style: ListTileStyle.list,
            title: CustomAutoSizeText(
              data: LocaleKeys.mainText_totalOrder.tr(),
              textColor: Colors.white,
            ),
            subtitle: BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, state) {
                return CustomAutoSizeNumber(
                  data: "${state.orderList?.order?.length ?? 0}",
                  textColor: Colors.white,
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}

class FetchCouriersCountBox extends StatelessWidget {
  const FetchCouriersCountBox({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    context.read<CourierBloc>().add(const CourierEvent());
    return Flexible(
        child: GestureDetector(
      onTap: () {
        NavigationService.instance
            .navigateToPage(path: NavigationConstants.courierListPage);
      },
      child: Card(
          color: appColors.couriersColor,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 110,
            ),
            child: ListTile(
              style: ListTileStyle.list,
              title: CustomAutoSizeText(
                data: LocaleKeys.mainText_totalCourier.tr(),
                textColor: Colors.white,
              ),
              subtitle: BlocBuilder<CourierBloc, CourierState>(
                builder: (context, state) {
                  return CustomAutoSizeNumber(
                    data: "${state.courierList?.courier?.length ?? 0}",
                    textColor: Colors.white,
                  );
                },
              ),
            ),
          )),
    ));
  }
}

class FetchCustomersCountBox extends StatelessWidget {
  const FetchCustomersCountBox({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    context.read<CustomerBloc>().add(FetchCustomerListEvent());
    return Flexible(
      child: GestureDetector(
        onTap: () {
          NavigationService.instance
              .navigateToPage(path: NavigationConstants.customerListPage);
        },
        child: Card(
          color: appColors.customersColor,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 110,
            ),
            child: ListTile(
              style: ListTileStyle.list,
              title: CustomAutoSizeText(
                data: LocaleKeys.mainText_totalCustomer.tr(),
                textColor: Colors.white,
              ),
              subtitle: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  return CustomAutoSizeNumber(
                    data: "${state.customerList?.customers.length ?? 0}",
                    textColor: Colors.white,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
