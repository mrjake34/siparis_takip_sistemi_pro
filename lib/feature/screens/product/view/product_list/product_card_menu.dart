part of 'product_list_page.dart';

final class _ProductCardMenu extends StatelessWidget {
  const _ProductCardMenu({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (details) => CardMoreButton.openMenu<void>(
          context: context,
          id: product.id ?? '',
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
    );
  }
}
