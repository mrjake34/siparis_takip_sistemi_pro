part of 'courier_login_page.dart';

final class _LoginPageRouterButton extends StatelessWidget {
  const _LoginPageRouterButton();

  @override
  Widget build(BuildContext context) {
    return MainElevatedButton(
      onPressed: () {
        context.router.replaceNamed(RoutePath.loginScreen.path);
      },
      child: Text(LocaleKeys.mainText_login.tr()),
    );
  }
}
