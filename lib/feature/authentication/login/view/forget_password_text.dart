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
      onPressed: () => Navigator.of(context).push(pageRouterPassReset()),
    );
  }

  MaterialPageRoute<dynamic> pageRouterPassReset() {
    return MaterialPageRoute(
      builder: (context) => PassReset(),
    );
  }
}
