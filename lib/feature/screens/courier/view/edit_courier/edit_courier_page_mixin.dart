part of 'edit_courier_page.dart';

mixin EditCourierPageMixin on State<EditCourierPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController(text: widget.courierModel.email);
    _nameController = TextEditingController(text: widget.courierModel.name);
    _phoneController = TextEditingController(text: widget.courierModel.phone);
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
