import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/providers/theme_providers.dart';
import 'package:siparis_takip_sistemi_pro/theme/dark_theme.dart';
import 'package:siparis_takip_sistemi_pro/theme/light_theme.dart';
import 'package:siparis_takip_sistemi_pro/theme/theme_service.dart';

class ChooseThemeWidget extends StatelessWidget {
  const ChooseThemeWidget({super.key});

  @override
  Widget build(BuildContext context) => ExpansionTile(
        trailing: const Icon(Icons.keyboard_double_arrow_down),
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
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    color: AppColors.instance.darkThemeColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<ThemeChange>().changeTheme = lightTheme;
                  ThemeService().saveTheme(ThemeEnums.lightTheme);
                  ThemeService().getThemeFromSave();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    color: AppColors.instance.lightThemeColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<ThemeChange>().setThemeAuto();
                  ThemeService().setRemoveSavedTheme();
                  ThemeService().getThemeFromSave();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.instance.darkThemeColor,
                        AppColors.instance.lightThemeColor
                      ],
                    ),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
