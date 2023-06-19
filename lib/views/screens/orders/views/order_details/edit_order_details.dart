import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/base/models/base_model_view.dart';
import '../../../../../core/constants/size/sizes.dart';
import '../../../../../core/singletons/translation/locale_keys.g.dart';
import '../../../customer/bloc/customer_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/bloc/add_order_bloc/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/bloc/products_bloc.dart';

class EditOrderPage extends StatefulWidget {
  const EditOrderPage({super.key});

  @override
  State<EditOrderPage> createState() => _EditOrderPageState();
}

class _EditOrderPageState extends State<EditOrderPage> with BaseModelView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.order_editOrder.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: BlocBuilder<OrdersBloc, OrdersState>(
            builder: (context, state) {
              if (state.order != null) {
                final order = state.order;
                final orderStatus = mainFunctions.getStringFromOrderStatus(
                  orderStatus: order?.orderStatus,
                );
                final iconData = mainFunctions.getIconFromOrderStatus(
                  orderStatus: order?.orderStatus,
                );
                final color = mainFunctions.getColorFromOrderStatus(
                  orderStatus: order?.orderStatus,
                );
                return Column(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(LocaleKeys.order_orderId.tr()),
                            subtitle: SelectableText(order?.id ?? ''),
                            style: ListTileStyle.drawer,
                          ),
                          ListTile(
                            title: Text(LocaleKeys.order_orderTime.tr()),
                            subtitle: Text(
                              DateFormat('yyyy/MM/dd - HH:mm ').format(order?.createdAt ?? DateTime.now()),
                            ),
                            style: ListTileStyle.drawer,
                          ),
                          ListTile(
                            title: Text(LocaleKeys.order_orderStatus.tr()),
                            subtitle: Row(
                              children: [
                                Icon(
                                  iconData,
                                  color: color,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(orderStatus),
                              ],
                            ),
                            style: ListTileStyle.drawer,
                          ),
                          ListTile(
                            title: Text(LocaleKeys.mainText_totalPrice.tr()),
                            subtitle: SelectableText(
                              order?.totalPrice.toStringAsFixed(2) ?? '',
                            ),
                            style: ListTileStyle.drawer,
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CustomerBloc, CustomerState>(
                      builder: (context, state) {
                        if (state.customerList != null) {
                          final customer = state.customerList?.customers.firstWhere(
                            (element) => element.id == order?.customerId,
                          );
                          return Card(
                            color: Theme.of(context).colorScheme.surface,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    LocaleKeys.customer_customerName.tr(),
                                  ),
                                  subtitle: SelectableText(customer?.name ?? ''),
                                  style: ListTileStyle.drawer,
                                ),
                                ListTile(
                                  title: Text(
                                    LocaleKeys.customer_customerPhone.tr(),
                                  ),
                                  subtitle: SelectableText(customer?.phone ?? ''),
                                  style: ListTileStyle.drawer,
                                ),
                                ListTile(
                                  title: Text(
                                    LocaleKeys.customer_customerAddress.tr(),
                                  ),
                                  subtitle: SelectableText(customer?.adress ?? ''),
                                  style: ListTileStyle.drawer,
                                ),
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: order?.products.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        final orderProduct = order?.products[index];
                        return Column(
                          children: [
                            BlocBuilder<ProductsBloc, ProductsState>(
                              builder: (context, state) {
                                if (state.productList != null) {
                                  final product = state.productList?.products.firstWhere(
                                    (element) => element.id == order?.products[index].productId,
                                  );

                                  final productTotalPrice = mainFunctions.productTotalPriceCalculator(
                                    quantity: product?.quantity,
                                    price: product?.price,
                                  );

                                  return ExpansionTile(
                                    initiallyExpanded: true,
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    title: Text(product?.name ?? ''),
                                    children: [
                                      ListTile(
                                        title: Text(
                                          LocaleKeys.product_productName.tr(),
                                        ),
                                        subtitle: Text(product?.name ?? ''),
                                        style: ListTileStyle.drawer,
                                      ),
                                      ListTile(
                                        title: Text(
                                          LocaleKeys.mainText_quantity.tr(),
                                        ),
                                        subtitle: Text(
                                          "${product?.quantity ?? "0"}",
                                        ),
                                        style: ListTileStyle.drawer,
                                      ),
                                      ListTile(
                                        title: Text(
                                          LocaleKeys.order_productUnitPrice.tr(),
                                        ),
                                        subtitle: Text(
                                          product?.price.toStringAsFixed(2) ?? '0.0',
                                        ),
                                        style: ListTileStyle.drawer,
                                      ),
                                      ListTile(
                                        title: Text(
                                          LocaleKeys.order_orderProductTotalPrice.tr(),
                                        ),
                                        subtitle: Text(
                                          productTotalPrice.toStringAsFixed(2),
                                        ),
                                        style: ListTileStyle.drawer,
                                      ),
                                      ListTile(
                                        title: Text(
                                          LocaleKeys.order_orderProductNote.tr(),
                                        ),
                                        subtitle: Text(
                                          orderProduct?.productNote ?? '',
                                        ),
                                        style: ListTileStyle.drawer,
                                      ),
                                    ],
                                  );
                                } else if (state.productList == null) {
                                  return Center(
                                    child: Text(
                                      LocaleKeys.errors_failedLoadData.tr(),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  );
                                }
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        );
                      },
                    ),
                  ],
                );
              } else if (state.order == null) {
                return Center(
                  child: Text(LocaleKeys.mainText_listEmpty.tr()),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
