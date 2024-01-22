part of 'edit_customer_page.dart';

mixin EditCustomerPageMixin on State<EditCustomerPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.customer?.name ?? '');
    _addressController =
        TextEditingController(text: widget.customer?.adress ?? '');
    _phoneController =
        TextEditingController(text: widget.customer?.phone ?? '');
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
