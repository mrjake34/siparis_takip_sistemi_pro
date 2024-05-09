part of 'register_page.dart';

mixin RegisterPageMixin on State<RegisterPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _shopNameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _password2Controller;
  late final GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _shopNameController = TextEditingController();
    _passwordController = TextEditingController();
    _password2Controller = TextEditingController();
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _shopNameController.dispose();
    _passwordController.dispose();
    _password2Controller.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  void _registerListener(RegisterState state) {
    if (state.status == Status.isFailed) {
      ProductItems.customSnackBar.errorSnackBar(
        LocaleKeys.errors_errorUserRegister.tr(),
      );
    } else if (state.status == Status.isDone) {
      context.router.replaceNamed(RoutePath.loginScreen.path);
      ProductItems.customSnackBar
          .showSnackBar(LocaleKeys.succes_registerSuccess.tr());
    }
  }
}
