import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/constants/size/sizes.dart';
import '../../../../core/init/translation/locale_keys.g.dart';
import '../../../../providers/main_providers.dart';
import '../../../../src/bottomsheets/main_bottom_sheets.dart';
import '../bloc/products_bloc.dart';
import '../model/product.dart';
import '../widgets/product_list_bottomsheet.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

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
                      Product? product = state.productList?.products[index];
                      return Card(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ProductDetailField(product: product),
                            ),
                            Expanded(
                              flex: 1,
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
    super.key,
    required this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(product?.name ?? ""),
          subtitle: Text(
              "${product?.price ?? ""} ${context.watch<ChangeCurrencyPriceSymbol>().currencySymbol}"),
        ),
      ],
    );
  }
}

class CardMoreButton extends StatelessWidget {
  const CardMoreButton({
    super.key,
    required this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MainBottomSheets().openBottomSheet(
              context, ProductListBottomSheet(product: product));
        },
        child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: const Icon(Icons.more_vert)));
  }
}
