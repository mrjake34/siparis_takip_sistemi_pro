part of 'profile_page.dart';

final class _ChangeLanguageField extends StatelessWidget {
  const _ChangeLanguageField();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: const Icon(Icons.keyboard_double_arrow_down),
      title: Text(LocaleKeys.profile_changeLanguage.tr()),
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                context.setLocale(LocaleEnums.en.locale);
              },
              child: Text(LocaleKeys.mainText_english.tr()),
            ),
            TextButton(
              onPressed: () {
                context.setLocale(LocaleEnums.tr.locale);
              },
              child: Text(LocaleKeys.mainText_turkish.tr()),
            ),
          ],
        ),
      ],
    );
  }
}
