part of 'courier_list_page.dart';

mixin CourierListPageMixin on State<CourierListPage> {
  @override
  void initState() {
    context.read<CourierBloc>().add(const CourierEvent());
    super.initState();
  }
}
