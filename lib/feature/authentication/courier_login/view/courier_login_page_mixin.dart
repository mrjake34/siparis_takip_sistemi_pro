part of 'courier_login_page.dart';

mixin CourierLoginPageMixin on State<CourierLoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormBuilderState> _loginKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _loginKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _loginKey.currentState?.dispose();
    super.dispose();
  }

  void courierLoginPageListener(
    CourierLoginPageState state,
  ) {
    if (state.status == Status.isDone) {
      CustomSnackBar.showSnackBar(LocaleKeys.succes_loginSuccess.tr());
      context.router.pushNamed(RoutePath.splashScreen.path);
    } else if (state.networkStatus == NetworkStatus.userNotFound) {
      CustomSnackBar.errorSnackBar(
        LocaleKeys.errors_userInfoIncorrect.tr(),
      );
    } else {
      CustomSnackBar.errorSnackBar(LocaleKeys.errors_loginError.tr());
    }
  }
}
