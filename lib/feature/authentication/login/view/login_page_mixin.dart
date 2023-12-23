part of 'login_page.dart';

mixin _LoginPageMixin on State<LoginPage> {
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

  double _maxWidth(BuildContext context) {
    return context.general.mediaSize.width >= 800
        ? 800
        : context.general.mediaSize.width / 1;
  }
}
