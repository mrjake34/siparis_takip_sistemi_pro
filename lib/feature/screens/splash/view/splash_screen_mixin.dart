part of 'splash_screen.dart';

mixin SplashScreenMixin on State<SplashScreen> {
  void _listener(BuildContext context, LoginState state) {
    if (state.autoLogin == AutoLogin.completed) {
      context.router.replaceNamed(RoutePath.homeScreen.path);
    } else if (state.autoLogin == AutoLogin.failed) {
      context.router.replaceNamed(RoutePath.loginScreen.path);
    }
  }

  bool _listenWhen(LoginState previous, LoginState current) =>
      previous.autoLogin != current.autoLogin;
}
