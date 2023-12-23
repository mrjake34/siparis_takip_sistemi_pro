part of 'login_page.dart';

final class _CourierLoginPageRouterButton extends StatelessWidget {
  const _CourierLoginPageRouterButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: MainElevatedButton(
            onPressed: () {
              context.router.replaceNamed(RoutePath.courierLoginScreen.path);
            },
            child: Text(LocaleKeys.mainText_courierLogin.tr()),
          ),
        ),
      ],
    );
  }
}
