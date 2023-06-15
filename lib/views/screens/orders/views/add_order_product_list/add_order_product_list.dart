// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/core/init/utils/utils.dart';
import 'package:siparis_takip_sistemi_pro/providers/main_providers.dart';
import 'package:siparis_takip_sistemi_pro/providers/search_providers.dart';
import 'package:siparis_takip_sistemi_pro/src/text/autosize_text.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/bloc/add_order_bloc/orders_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/bloc/products_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/model/product.dart';

class AddOrderProductList extends StatelessWidget with BaseModelView {
  AddOrderProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(const ProductListEvent());
    return Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: Column(
        children: [
          const SearchField(),
          Flexible(
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state.status == Status.isDone) {
                  final productList = state.productList?.products
                      .where((element) => element.name.toLowerCase().contains(context.watch<AddOrderAddProductSearchProvider>().getSearchValue))
                      .toList();
                  return ListView.builder(
                    key: UniqueKey(),
                    shrinkWrap: true,
                    itemCount: productList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = productList?[index];
                      return ProductCard(
                        product: product,
                        utils: utils,
                        index: index,
                        state: state,
                      );
                    },
                  );
                } else if (state.status == Status.isFailed) {
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
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.utils,
    required this.state,
    required this.index,
    super.key,
  });

  final Product? product;
  final UtilsService utils;
  final ProductsState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(product?.name ?? ''),
                  subtitle: Text("${product?.price ?? ""} ${context.watch<ChangeCurrencyPriceSymbol>().currencySymbol}"),
                ),
              ],
            ),
          ),
          Expanded(
            child: AddProductButton(
              utils: utils,
              index: index,
              state: state,
            ),
          ),
        ],
      ),
    );
  }
}

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    required this.utils,
    required this.state,
    required this.index,
    super.key,
  });

  final UtilsService utils;
  final ProductsState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        try {
          if (state.productList?.products != null) {
            context.read<OrdersBloc>().add(OrderCartProductsEvent(product: state.productList?.products[index]));
          }
        } finally {
          utils.showSnackBar(LocaleKeys.succes_productAdded.tr());
        }
      },
      icon: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAutoSizeText(
          data: LocaleKeys.product_addProduct.tr(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: TextFormField(
            initialValue: context.watch<AddOrderAddProductSearchProvider>().getSearchValue,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: InputBorder.none,
              suffixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {
              context.read<AddOrderAddProductSearchProvider>().setSearchValue = value.toLowerCase();
            },
          ),
        ),
      ],
    );
  }
}
