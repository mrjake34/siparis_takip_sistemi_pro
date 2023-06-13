import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/theme/theme_service.dart';
import '../../../../providers/theme_providers.dart';
import '../../../../theme/dark_theme.dart';
import '../../../../theme/light_theme.dart';

class ChooseThemeWidget extends StatelessWidget {
  const ChooseThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(LocaleKeys.profile_chooseTheme.tr()),
      children: [
        Wrap(
          children: [
            TextButton(
                onPressed: () {
                  context.read<ThemeChange>().changeTheme = darkTheme;
                  ThemeService().saveTheme(ThemeEnums.darkTheme);
                  ThemeService().getThemeFromSave();
                },
                child: Text(
                  LocaleKeys.mainText_darkTheme.tr(),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                )),
            TextButton(
                onPressed: () {
                  context.read<ThemeChange>().changeTheme = lightTheme;
                  ThemeService().saveTheme(ThemeEnums.lightTheme);
                  ThemeService().getThemeFromSave();
                },
                child: Text(
                  LocaleKeys.mainText_lightTheme.tr(),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                )),
            TextButton(
                onPressed: () {
                  context.read<ThemeChange>().setThemeAuto();
                  ThemeService().setRemoveSavedTheme();
                  ThemeService().getThemeFromSave();
                },
                child: Text(
                  LocaleKeys.mainText_autoTheme.tr(),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                )),
          ],
        ),
      ],
    );
  }
}
