part of 'login_page.dart';

final class _RegisterText extends StatelessWidget {
  const _RegisterText();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.mainText_haventAccount.tr()),
        TextButton(
          onPressed: () {
            context.router.replaceNamed(RoutePath.registerScreen.path);
          },
          child: Text(LocaleKeys.mainText_signup.tr()),
        ),
      ],
    );
  }
}
