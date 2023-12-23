part of 'product_list_page.dart';

final class _ProductDetailField extends StatelessWidget {
  const _ProductDetailField({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(product.name ?? ''),
          subtitle: Text('${product.price ?? ''}'),
        ),
      ],
    );
  }
}
