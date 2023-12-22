import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/bloc/products_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/product_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/providers/main_providers.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/cards_more_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/list_card.dart';

import '../../../../product/core/constants/colors/colors.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/core/constants/navigation/navigation_constants.dart';

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
    return BaseScaffold(
      body: Column(
        children: [
          const LinearField(),
          Flexible(
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state.productList != null) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(AppSize.pagePadding),
                    itemCount: state.productList?.products.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final product = state.productList?.products[index];
                      return ListCard(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ProductDetailField(product: product),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTapDown: (details) => CardMoreButton.openMenu(
                                  context: context,
                                  path: NavigationConstants.productEditPage,
                                  id: product?.id ?? '',
                                  function: () {
                                    // ProductService()
                                    //     .deleteProduct(product?.id ?? '')
                                    //     .whenComplete(
                                    //         () => Navigator.pop(context));
                                  },
                                  offset: details.globalPosition,
                                ),
                                child: const Icon(Icons.more_vert),
                              ),
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
          subtitle: Text(
              "${product?.price ?? ""} ${context.watch<ChangeCurrencyPriceSymbol>().currencySymbol}"),
        ),
      ],
    );
  }
}
