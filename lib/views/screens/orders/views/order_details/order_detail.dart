import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/base/models/base_model_view.dart';
import '../../../../../core/constants/size/sizes.dart';
import '../../../customer/bloc/customer_bloc.dart';
import '../../bloc/add_order_bloc/orders_bloc.dart';
import '../../../product/bloc/products_bloc.dart';
import '../../../../../core/init/translation/locale_keys.g.dart';
import '../../../../../providers/main_providers.dart';
import '../../../customer/model/customer.dart';
import '../../../product/model/product.dart';
import '../../model/order.dart';

// ignore: must_be_immutable
class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> with BaseModelView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.order_orderDetail.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: BlocBuilder<OrdersBloc, OrdersState>(
            buildWhen: (previous, current) =>
                previous.orderList != current.orderList,
            builder: (context, state) {
              Order? order = state.order;
              String orderStatusText = mainFunctions.getStringFromOrderStatus(
                  orderStatus: order?.orderStatus);
              IconData iconData = mainFunctions.getIconFromOrderStatus(
                  orderStatus: order?.orderStatus);
              Color color = mainFunctions.getColorFromOrderStatus(
                  orderStatus: order?.orderStatus);
              return Column(children: [
                Column(
                  children: [
                    ListTile(
                      title: Text(LocaleKeys.order_orderId.tr()),
                      trailing: SelectableText(
                        order?.id ?? "",
                        style: const TextStyle(fontSize: 14),
                      ),
                      style: ListTileStyle.drawer,
                    ),
                    ListTile(
                      title: Text(LocaleKeys.order_orderTime.tr()),
                      trailing: Text(
                        DateFormat("yyyy/MM/dd - HH:mm ")
                            .format(order?.createdAt ?? DateTime.now()),
                        style: const TextStyle(fontSize: 14),
                      ),
                      style: ListTileStyle.drawer,
                    ),
                    ListTile(
                      title: Text(LocaleKeys.order_orderStatus.tr()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            iconData,
                            color: color,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(orderStatusText,
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      style: ListTileStyle.drawer,
                    ),
                    ListTile(
                      title: Text(LocaleKeys.mainText_totalPrice.tr()),
                      trailing: SelectableText(
                        "${order?.totalPrice.toStringAsFixed(2) ?? 0.0} ${context.watch<ChangeCurrencyPriceSymbol>().getSymbol}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      style: ListTileStyle.drawer,
                    ),
                  ],
                ),
                BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    Customer? customer = state.customerList?.customers
                        ?.firstWhere(
                            (element) => element.id == order?.customerId);
                    return Column(
                      children: [
                        ListTile(
                          title: Text(LocaleKeys.customer_customerName.tr()),
                          trailing: SelectableText(
                            customer?.name ?? " ",
                            style: const TextStyle(fontSize: 14),
                          ),
                          style: ListTileStyle.drawer,
                        ),
                        ListTile(
                          title: Text(LocaleKeys.customer_customerPhone.tr()),
                          trailing: SelectableText(
                            customer?.phone ?? " ",
                            style: const TextStyle(fontSize: 14),
                          ),
                          style: ListTileStyle.drawer,
                        ),
                        ListTile(
                          title: Text(
                            LocaleKeys.customer_customerAddress.tr(),
                          ),
                          subtitle: SelectableText(
                            customer?.address ?? " ",
                            style: const TextStyle(fontSize: 14),
                          ),
                          style: ListTileStyle.drawer,
                        ),
                      ],
                    );
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: order?.products.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    ProductProduct? orderProduct = order?.products[index];
                    int orderQuantity = int.parse(orderProduct?.quantity ?? "");
                    return Column(
                      children: [
                        BlocBuilder<ProductsBloc, ProductsState>(
                          buildWhen: (previous, current) =>
                              previous.productList != current.productList,
                          builder: (context, state) {
                            Product? product = state.productList?.products
                                .firstWhere((element) =>
                                    element.id == orderProduct?.productId);
                            double productTotalPrice =
                                mainFunctions.productTotalPriceCalculator(
                                    quantity: orderQuantity,
                                    price: product?.price);
                            return ExpansionTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              trailing:
                                  const Icon(Icons.keyboard_double_arrow_down),
                              title: Text(product?.name ?? ""),
                              children: [
                                ListTile(
                                  title:
                                      Text(LocaleKeys.product_productName.tr()),
                                  trailing: Text(
                                    product?.name ?? "",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  style: ListTileStyle.drawer,
                                ),
                                ListTile(
                                  title:
                                      Text(LocaleKeys.mainText_quantity.tr()),
                                  trailing: Text(
                                    "$orderQuantity",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  style: ListTileStyle.drawer,
                                ),
                                ListTile(
                                  title: Text(
                                      LocaleKeys.order_productUnitPrice.tr()),
                                  trailing: Text(
                                    product?.price.toStringAsFixed(2) ?? "",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  style: ListTileStyle.drawer,
                                ),
                                ListTile(
                                  title: Text(LocaleKeys
                                      .order_orderProductTotalPrice
                                      .tr()),
                                  trailing: Text(
                                    productTotalPrice.toStringAsFixed(2),
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  style: ListTileStyle.drawer,
                                ),
                                ListTile(
                                  title: Text(
                                    LocaleKeys.order_orderProductNote.tr(),
                                  ),
                                  subtitle: Text(
                                    orderProduct?.productNote ?? " ",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  style: ListTileStyle.drawer,
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    );
                  },
                )
              ]);
            },
          ),
        ),
      ),
    );
  }
}
