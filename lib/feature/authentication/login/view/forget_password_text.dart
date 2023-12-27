part of 'login_page.dart';

final class _ForgetPasswordText extends StatelessWidget {
  const _ForgetPasswordText();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        LocaleKeys.mainText_forgetPassword.tr(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontSize: 15,
        ),
      ),
      onPressed: () =>
          context.router.pushNamed(RoutePath.passwordResetScreen.path),
    );
  }
}
