part of 'product_list_page.dart';

mixin ProductListPageMixin on State<ProductListPage> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(const ProductListEvent());
    super.initState();
  }
}
