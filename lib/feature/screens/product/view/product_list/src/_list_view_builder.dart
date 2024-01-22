part of '../product_list_page.dart';

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
