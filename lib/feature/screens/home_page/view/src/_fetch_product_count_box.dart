part of '../home_page.dart';

final class _FetchProductsCountBox extends StatelessWidget {
  const _FetchProductsCountBox();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: ColorName.productsColor,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 110,
            ),
            child: ListTile(
              style: ListTileStyle.list,
              title: CustomAutoSizeText(
                data: LocaleKeys.mainText_totalProducts.tr(),
                textColor: Colors.white,
              ),
              subtitle: BlocProvider(
                create: (context) => ProductsBloc(
                  productService: ProductService(),
                )..add(const ProductListEvent()),
                child: BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    final productList = state.productList;
                    if (productList == null) return const SizedBox();
                    return CustomAutoSizeNumber(
                      data: '${productList.length}',
                      textColor: Colors.white,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
