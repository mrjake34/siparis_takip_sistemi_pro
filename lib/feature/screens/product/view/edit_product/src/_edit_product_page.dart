part of '../index.dart';

@RoutePage()
final class EditProductPage extends StatefulWidget {
  const EditProductPage({required this.product, super.key});
  final Product product;

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

final class _EditProductPageState extends State<EditProductPage>
    with _EditProductPageMixin {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocProvider(
        create: (context) => ProductsBloc(
          productService: ProductItems.productService,
        ),
        child: Column(
          children: [
            Flexible(
              child: _ProductField(
                nameController: _nameController,
                priceController: _priceController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
