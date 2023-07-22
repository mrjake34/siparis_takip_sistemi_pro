// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/navigation/navigation_constants.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/styles/text_styles.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/navigation/navigation_service.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/utils/utils.dart';
import 'package:siparis_takip_sistemi_pro/providers/main_providers.dart';
import 'package:siparis_takip_sistemi_pro/src/bottomsheets/main_bottom_sheets.dart';
import 'package:siparis_takip_sistemi_pro/src/button/main_elevated_button.dart';
import 'package:siparis_takip_sistemi_pro/src/button/main_elevated_button_without_color.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/bloc/add_order_bloc/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/add_customer_in_add_order/add_order_add_customer.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/views/add_order_product_list/add_order_product_list.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/model/product.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> with BaseModelView {
  TextEditingController orderNoteController = TextEditingController();

  TextEditingController orderProductNoteController = TextEditingController();
  final OrdersBloc _ordersBloc = OrdersBloc();

  @override
  void dispose() {
    _ordersBloc.add(const AddOrderClearProductList());
    orderNoteController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      navService: navService,
      orderNoteController: orderNoteController,
      utils: utils,
      appNetwork: appNetwork,
    );
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required this.navService,
    required this.orderNoteController,
    required this.utils,
    required this.appNetwork,
    super.key,
  });

  final NavigationService navService;
  final TextEditingController orderNoteController;
  final UtilsService utils;
  final AppNetwork appNetwork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.order_addOrder.tr(),
        ),
        leading: IconButton(
          onPressed: () {
            navService.navigateToPageRemoveAll(
              path: NavigationConstants.splashScreen,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          ActionChip(
            disabledColor: Theme.of(context).colorScheme.surface,
            avatar: const Icon(Icons.shopping_basket_outlined),
            labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
            label: Row(
              children: [
                Text(context.watch<ChangeCurrencyPriceSymbol>().currencySymbol),
                BlocBuilder<OrdersBloc, OrdersState>(
                  buildWhen: (previous, current) => previous.orderCartTotalPrice != current.orderCartTotalPrice,
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Column(
            children: [
              const CustomerField(),
              OrderNoteField(orderNoteController: orderNoteController),
              const AddProductHeader(),
              const SizedBox(
                height: 10,
              ),
              ProductCard(
                utils: utils,
                appNetwork: appNetwork,
              ),
              const SizedBox(
                height: 20,
              ),
              AddOrderButton(
                orderNoteController: orderNoteController,
                utils: utils,
              ),
              const SizedBox(
                height: 20,
              ),
              ClearButton(
                orderNoteController: orderNoteController,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
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
    required this.utils,
    super.key,
  });

  final TextEditingController orderNoteController;
  final UtilsService utils;

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
              MainBottomSheets().openBottomSheet(context, AddOrderProductList());
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

class ProductCard extends StatelessWidget {
  const ProductCard({required this.utils, required this.appNetwork, super.key});

  final UtilsService utils;
  final AppNetwork appNetwork;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      buildWhen: (previous, current) => previous.productList != current.productList,
      builder: (context, state) {
        return Card(
          color: Theme.of(context).colorScheme.surface,
          child: ListView.builder(
            key: UniqueKey(),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.productList?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final product = state.productList?[index];
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(product?.name ?? ''),
                          subtitle: Text(
                            "${product?.price ?? ""} ${context.watch<ChangeCurrencyPriceSymbol>().currencySymbol}",
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
                          onPressed: () {
                            try {
                              context.read<OrdersBloc>().add(
                                    OrderCartRemoveProductEvent(
                                      index: index,
                                    ),
                                  );
                            } finally {
                              utils.showSnackBar(
                                LocaleKeys.succes_productRemovedFromList.tr(),
                              );
                            }
                          },
                          icon: Icon(
                            Icons.delete,
                            color: AppColors.instance.removeColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  ProductNoteField(
                    product: product,
                    index: index,
                  ),
                ],
              );
            },
          ),
        );
      },
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
                      OrderCartChangeProductNoteEvent(index: index, note: value),
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
                    buildWhen: (previous, current) => previous.customer != current.customer,
                    builder: (context, state) {
                      return ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Text(
                            '${LocaleKeys.customer_customerName.tr()}: ',
                            style: justBoldFontTextStyle,
                          ),
                          SelectableText(
                            state.customer?.name ?? ' ',
                            minLines: 1,
                            maxLines: 3,
                          ),
                          Text(
                            '${LocaleKeys.customer_customerPhone.tr()}: ',
                            style: justBoldFontTextStyle,
                          ),
                          SelectableText(
                            state.customer?.phone ?? ' ',
                            minLines: 1,
                            maxLines: 3,
                          ),
                          Text(
                            '${LocaleKeys.customer_customerAddress.tr()}: ',
                            style: justBoldFontTextStyle,
                          ),
                          SelectableText(
                            state.customer?.adress ?? '',
                            minLines: 1,
                            maxLines: 3,
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  MainBottomSheets().openBottomSheetNoScrollable(
                    context,
                    const AddOrderAddCustomer(),
                  );
                },
                icon: Icon(
                  Icons.person_add_alt,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
