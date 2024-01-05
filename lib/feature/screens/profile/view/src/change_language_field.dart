import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../product/utils/localization/localization_manager.dart';
import '../../../../../product/utils/translations/locale_keys.g.dart';

final class ChangeLanguageField extends StatelessWidget {
  const ChangeLanguageField({super.key});

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
