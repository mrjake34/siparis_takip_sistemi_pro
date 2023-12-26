part of 'add_customer_page.dart';

mixin _AddCustomerPageMixin on State<AddCustomerPage> {
  late final GlobalKey<FormBuilderState> _formKey;
  late final TextEditingController _customerNameController;
  late final TextEditingController _customerPhoneController;
  late final TextEditingController _customerAddressController;
  late final DeviceType _deviceType;

  @override
  void initState() {
    _deviceType = ProductItems.deviceInfo.getDeviceType();
    _formKey = GlobalKey<FormBuilderState>();
    _customerNameController = TextEditingController();
    _customerPhoneController = TextEditingController();
    _customerAddressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _customerPhoneController.dispose();
    _customerAddressController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
