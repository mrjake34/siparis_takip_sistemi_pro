import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/bloc/products_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/list_card.dart';
import 'package:siparis_takip_sistemi_pro/product/src/text/autosize_text.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../../../../../product/src/text/failed_load_data_text.dart';
import '../../../../../product/src/widgets/adaptive_indicator.dart';
import '../../../product/model/product.dart';

final class AddOrderProductList extends StatelessWidget {
  const AddOrderProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchField(),
        BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state.productList == null) return const FailedLoadDataText();
            if (state.productList != null) {
              return ListViewBuilder(productList: state.productList ?? []);
            }
            return const AdaptiveIndicator();
          },
        ),
      ],
    );
  }
}

final class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    required this.productList,
    super.key,
  });
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: UniqueKey(),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(product: productList[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return ListCard(
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
                  subtitle: Text(
                    '${product?.price ?? 0.0}',
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: AddProductButton(),
          ),
        ],
      ),
    );
  }
}

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
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
            initialValue: '',
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: InputBorder.none,
              suffixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
