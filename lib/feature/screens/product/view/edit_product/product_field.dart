part of 'index.dart';

final class _ProductField extends StatelessWidget {
  const _ProductField({
    required this.nameController,
    required this.priceController,
  });

  final TextEditingController nameController;
  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _EditProductNameTextField(nameController: nameController),
        const SizedBox(height: 10),
        _EditProductPriceTextField(priceController: priceController),
      ],
    );
  }
}
