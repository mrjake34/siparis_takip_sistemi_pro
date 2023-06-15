import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/providers/main_providers.dart';
import 'package:siparis_takip_sistemi_pro/src/bottomsheets/main_bottom_sheets.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/bloc/products_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/widgets/product_list_bottomsheet.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBuilder();
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(const ProductListEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.product_productList.tr(),
        ),
      ),
      body: Column(
        children: [
          const LinearField(),
          Flexible(
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state.productList != null) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(pagePadding),
                    itemCount: state.productList?.products.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final product = state.productList?.products[index];
                      return Card(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ProductDetailField(product: product),
                            ),
                            Expanded(
                              child: CardMoreButton(product: product),
                            ),
                          ],
                        ),
                      );
                    },
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

class LinearField extends StatelessWidget {
  const LinearField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.isLoading) {
          return LinearProgressIndicator(
            color: AppColors.instance.alternativeButtonColor,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ProductDetailField extends StatelessWidget {
  const ProductDetailField({
    required this.product,
    super.key,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(product?.name ?? ''),
          subtitle: Text("${product?.price ?? ""} ${context.watch<ChangeCurrencyPriceSymbol>().currencySymbol}"),
        ),
      ],
    );
  }
}

class CardMoreButton extends StatelessWidget {
  const CardMoreButton({
    required this.product,
    super.key,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MainBottomSheets().openBottomSheet(context, ProductListBottomSheet(product: product));
      },
      child: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.surface, child: const Icon(Icons.more_vert)),
    );
  }
}
