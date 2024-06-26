// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/bloc/add_order/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/add_customer_in_add_order/add_order_add_customer.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/add_order_product_list/add_order_product_list.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/styles/text_styles.dart';
import 'package:siparis_takip_sistemi_pro/product/src/bottomsheets/main_bottom_sheets.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/main_elevated_button_without_color.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/failed_load_data_text.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../../../../../gen/index.dart';
import '../../../../../product/utils/router/route_manager.dart';

/// This page is used to add orders.
/// not finished yet.
/// when editing is finished, it will be used.
@RoutePage()
final class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

final class _AddOrderState extends State<AddOrder> {
  final orderNoteController = TextEditingController();
  final orderProductNoteController = TextEditingController();
  final _ordersBloc = OrdersBloc(ProductItems.orderService);

  @override
  void dispose() {
    _ordersBloc.add(const AddOrderClearProductList());
    orderNoteController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.order_addOrder.tr(),
        ),
        leading: IconButton(
          onPressed: () =>
              context.router.replaceNamed(RoutePath.splashScreen.path),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          ActionChip(
            disabledColor: Theme.of(context).colorScheme.surface,
            avatar: const Icon(Icons.shopping_basket_outlined),
            labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
            label: Row(
              children: [
                BlocBuilder<OrdersBloc, OrdersState>(
                  buildWhen: (previous, current) =>
                      previous.orderCartTotalPrice !=
                      current.orderCartTotalPrice,
                  builder: (context, state) {
                    return Text(
                      state.orderCartTotalPrice?.toStringAsFixed(2) ?? '0.00',
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomerField(),
            OrderNoteField(orderNoteController: orderNoteController),
            const AddProductHeader(),
            const SizedBox(
              height: 10,
            ),
            const ProductCard(),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            Wrap(
              runSpacing: 20,
              spacing: 100,
              children: [
                AddOrderButton(
                  orderNoteController: orderNoteController,
                ),
                ClearButton(
                  orderNoteController: orderNoteController,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({
    required this.orderNoteController,
    super.key,
  });
  final TextEditingController orderNoteController;

  @override
  Widget build(BuildContext context) {
    return MainElevatedButtonWithoutColor(
      onPressed: () {
        orderNoteController.clear();
        context.read<OrdersBloc>().add(const AddOrderClearProductList());
      },
      child: Text(LocaleKeys.mainText_clear.tr()),
    );
  }
}

class AddOrderButton extends StatelessWidget {
  const AddOrderButton({
    required this.orderNoteController,
    super.key,
  });

  final TextEditingController orderNoteController;

  @override
  Widget build(BuildContext context) {
    return MainElevatedButton(
      onPressed: () {
        context.read<OrdersBloc>().add(
              AddOrderPostOrderEvent(
                orderNote: orderNoteController.text.trim(),
              ),
            );
      },
      child: Text(LocaleKeys.order_addOrder.tr()),
    );
  }
}

class AddProductHeader extends StatelessWidget {
  const AddProductHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Icon(
            Icons.view_in_ar,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Expanded(flex: 3, child: Text(LocaleKeys.product_productName.tr())),
        Expanded(flex: 2, child: Text(LocaleKeys.mainText_quantity.tr())),
        Expanded(
          child: IconButton(
            onPressed: () {
              CustomBottomSheets.openBottomSheet<void>(
                context,
                const AddOrderProductList(),
              );
            },
            icon: Icon(
              Icons.add_circle_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

final class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state.productList == null) return const FailedLoadDataText();
          return ListView.builder(
            key: UniqueKey(),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.productList?.length,
            itemBuilder: (BuildContext context, int index) {
              final product = state.productList?[index];
              if (product == null) return const SizedBox();
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(product.name ?? ''),
                          subtitle: Text(
                            product.price?.toStringAsFixed(2) ?? '0.00',
                          ),
                        ),
                      ),
                      Expanded(
                        child: ProductCountField(
                          product: product,
                          index: index,
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: ColorName.removeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ProductNoteField(
                    product: product,
                    index: index,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class ProductCountField extends StatelessWidget {
  const ProductCountField({
    super.key,
    this.product,
    this.index,
  });
  final Product? product;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: product?.quantity.toString() ?? '0',
      maxLength: 15,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty) {
          if (int.parse(value) <= 15) {
            context.read<OrdersBloc>().add(
                  OrderCartChangeProductCountEvent(
                    index: index,
                    count: int.parse(value),
                  ),
                );
          }
        }
      },
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        border: InputBorder.none,
        fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.2),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
      ]),
    );
  }
}

class ProductNoteField extends StatelessWidget {
  const ProductNoteField({
    required this.product,
    super.key,
    this.index,
  });
  final Product? product;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: FormBuilder(
          key: UniqueKey(),
          child: TextFormField(
            initialValue: product?.productNote ?? '',
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.2),
              border: InputBorder.none,
              hintText: LocaleKeys.order_orderProductNote.tr(),
            ),
            onChanged: (String value) {
              if (value.isNotEmpty) {
                context.read<OrdersBloc>().add(
                      OrderCartChangeProductNoteEvent(
                        index: index,
                        note: value,
                      ),
                    );
              }
            },
          ),
        ),
      ),
    );
  }
}

class OrderNoteField extends StatelessWidget {
  const OrderNoteField({
    required this.orderNoteController,
    super.key,
  });

  final TextEditingController orderNoteController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: TextFormField(
          controller: orderNoteController,
          textInputAction: TextInputAction.done,
          minLines: 3,
          maxLines: 3,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: LocaleKeys.order_addOrderNote.tr(),
          ),
        ),
      ),
    );
  }
}

class CustomerField extends StatelessWidget {
  const CustomerField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      AutoSizeText(
                        LocaleKeys.customer_customerInfo.tr(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<OrdersBloc, OrdersState>(
                    buildWhen: (previous, current) =>
                        previous.customer != current.customer,
                    builder: (context, state) {
                      if (state.customer == null) {
                        return Text(
                          LocaleKeys.errors_failedLoadData.tr(),
                        );
                      }
                      return ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Text(
                            '${LocaleKeys.customer_customerName.tr()}: ',
                            style: CustomTextStyles.justBoldFontTextStyle,
                          ),
                          SelectableText(
                            state.customer?.name ?? ' ',
                            minLines: 1,
                            maxLines: 3,
                          ),
                          Text(
                            '${LocaleKeys.customer_customerPhone.tr()}: ',
                            style: CustomTextStyles.justBoldFontTextStyle,
                          ),
                          SelectableText(
                            state.customer?.phone ?? ' ',
                            minLines: 1,
                            maxLines: 3,
                          ),
                          Text(
                            '${LocaleKeys.customer_customerAddress.tr()}: ',
                            style: CustomTextStyles.justBoldFontTextStyle,
                          ),
                          SelectableText(
                            state.customer?.adress ?? '',
                            minLines: 1,
                            maxLines: 3,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  CustomBottomSheets.openBottomSheetNoScrollable<void>(
                    context,
                    const AddOrderAddCustomer(),
                  );
                },
                icon: Icon(
                  Icons.person_add_alt,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
