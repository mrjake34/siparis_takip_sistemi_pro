// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/bloc/add_order/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/bloc/products_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/autosize_number.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/autosize_text.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

@RoutePage()

/// This class is view a home page
class HomePage extends StatelessWidget {
  /// This is contructor method for the home page
  const HomePage({required this.userModel, super.key});

  /// This is the user model
  final UserResponseModel userModel;

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

class _FetchOrderStatusCount extends StatelessWidget {
  const _FetchOrderStatusCount();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _PendingOrdersCountField(),
        SizedBox(
          height: 10,
        ),
        _ProcessOrdersCountField(),
        SizedBox(
          height: 10,
        ),
        _OnTheWayOrdersCountField(),
        SizedBox(
          height: 10,
        ),
        _DoneOrdersCountField(),
      ],
    );
  }
}

class _DoneOrdersCountField extends StatelessWidget {
  const _DoneOrdersCountField();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.orderIsDoneColor,
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
              final doneOrders = state.doneOrders;
              if (doneOrders == null) return const SizedBox();
              return CustomAutoSizeNumber(
                data: '${doneOrders.length}',
                textColor: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _OnTheWayOrdersCountField extends StatelessWidget {
  const _OnTheWayOrdersCountField();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.orderOnTheWayColor,
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
              final onTheWayOrders = state.onTheWayOrders;
              if (onTheWayOrders == null) return const SizedBox();
              return CustomAutoSizeNumber(
                data: '${onTheWayOrders.length}',
                textColor: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ProcessOrdersCountField extends StatelessWidget {
  const _ProcessOrdersCountField();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.orderInProcessColor,
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
                data: '${state.processOrders?.length ?? 0}',
                textColor: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PendingOrdersCountField extends StatelessWidget {
  const _PendingOrdersCountField();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.orderPendingColor,
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
                data: '${state.pendingOrders?.length ?? 0}',
                textColor: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FetchProductsCountBox extends StatelessWidget {
  const _FetchProductsCountBox();

  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(const ProductListEvent());
    return Flexible(
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: AppColors.productsColor,
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
                  final productList = state.productList;
                  if (productList == null) return const SizedBox();
                  return CustomAutoSizeNumber(
                    data: '${productList.length}',
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

class _FetchOrdersCountBox extends StatelessWidget {
  const _FetchOrdersCountBox();

  @override
  Widget build(BuildContext context) {
    context.read<OrdersBloc>().add(OrdersListEvent());
    return Flexible(
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: AppColors.ordersColor,
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
                  final orderList = state.orderList;
                  if (orderList == null) return const SizedBox();
                  return CustomAutoSizeNumber(
                    data: '${orderList.length}',
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

class _FetchCouriersCountBox extends StatelessWidget {
  const _FetchCouriersCountBox();

  @override
  Widget build(BuildContext context) {
    context.read<CourierBloc>().add(const CourierEvent());
    return Flexible(
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: AppColors.couriersColor,
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
                  final courierList = state.courierList;
                  if (courierList == null) return const SizedBox();
                  return CustomAutoSizeNumber(
                    data: '${courierList.couriers.length}',
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

class _FetchCustomersCountBox extends StatelessWidget {
  const _FetchCustomersCountBox();

  @override
  Widget build(BuildContext context) {
    context.read<CustomerBloc>().add(FetchCustomerListEvent());
    return Flexible(
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: AppColors.customersColor,
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
                  final customerList = state.customerList?.customers;
                  if (customerList == null) return const SizedBox();
                  return CustomAutoSizeNumber(
                    data: '${customerList.length}',
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
