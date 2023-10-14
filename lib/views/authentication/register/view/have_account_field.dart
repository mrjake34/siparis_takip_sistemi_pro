part of 'signup_page.dart';

final class _HaveAccountField extends StatelessWidget with BaseModelView {
  _HaveAccountField();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.mainText_haveAccount.tr(),
        ),
        TextButton(
          onPressed: navService.navigateToBack,
          child: Text(
            LocaleKeys.mainText_login.tr(),
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
