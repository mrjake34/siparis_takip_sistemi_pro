part of 'index.dart';

mixin _EditProductPageMixin on State<EditProductPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.product.name);
    _priceController =
        TextEditingController(text: '${widget.product.price ?? 0}');
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
