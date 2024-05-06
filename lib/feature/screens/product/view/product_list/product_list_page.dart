import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/bloc/products_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/product_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/cards_more_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/list_card.dart';
import 'package:siparis_takip_sistemi_pro/product/src/shimmer/list_shimmer.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

part 'src/_product_detail_field.dart';
part 'src/_product_card_menu.dart';
part 'product_list_page_mixin.dart';
part 'src/_list_view_builder.dart';

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
          Flexible(
            child: BlocProvider(
              create: (context) => ProductsBloc(
                productService: ProductItems.productService,
              ),
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state.productList.ext.isNullOrEmpty) {
                    return const ListShimmer();
                  }
                  return _ListViewBuilder(productList: state.productList!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
