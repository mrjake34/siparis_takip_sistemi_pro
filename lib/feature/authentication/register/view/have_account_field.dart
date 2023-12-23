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
