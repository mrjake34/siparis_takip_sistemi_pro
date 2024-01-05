part of 'register_page.dart';

final class _HaveAccountField extends StatelessWidget {
  const _HaveAccountField();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.mainText_haveAccount.tr(),
        ),
        TextButton(
          onPressed: () =>
              context.router.replaceNamed(RoutePath.loginScreen.path),
          child: Text(
            LocaleKeys.mainText_login.tr(),
          ),
        ),
      ],
    );
  }
}
