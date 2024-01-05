import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/bloc/products_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/product_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/cards_more_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/list_card.dart';

import '../../../../../gen/index.dart';
import '../../../../../product/core/constants/enums/enums.dart';

part 'linear_field.dart';
part 'product_detail_field.dart';
part 'product_card_menu.dart';
part 'product_list_page_mixin.dart';

@RoutePage()
final class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

final class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const _LinearField(),
          Flexible(
            child: BlocProvider(
              create: (context) => ProductsBloc(
                productService: ProductService(),
              ),
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state.productList.ext.isNotNullOrEmpty) {
                    return _ListViewBuilder(productList: state.productList!);
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder({
    required this.productList,
  });
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSize.pagePadding),
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        final product = productList[index];
        return ListCard(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: _ProductDetailField(product: product),
              ),
              _ProductCardMenu(product: product),
            ],
          ),
        );
      },
    );
  }
}
