import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../../../product/core/constants/colors/colors.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../../../../product/providers/theme_providers.dart';
import '../../../../product/theme/dark_theme.dart';
import '../../../../product/theme/light_theme.dart';
import '../../../../product/theme/theme_service.dart';

class ChooseThemeWidget extends StatelessWidget {
  const ChooseThemeWidget({super.key});

  @override
  Widget build(BuildContext context) => ExpansionTile(
        trailing: const Icon(Icons.keyboard_double_arrow_down),
        title: Text(LocaleKeys.profile_chooseTheme.tr()),
        children: [
          Wrap(
            children: [
              const DarkLightThemeButtons(),
              TextButton(
                onPressed: () {
                  //changes the theme as a null
                  context.read<ThemeChange>().setThemeAuto();
                  //revomes the saved theme
                  ProductItems.themeService.setRemoveSavedTheme();
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

class DarkLightThemeButtons extends StatelessWidget {
  const DarkLightThemeButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //if the theme is light theme returns dark theme button
    if (context.watch<ThemeChange>().getTheme == lightTheme) {
      return TextButton(
        onPressed: () {
          //changes the theme to dark theme
          context.read<ThemeChange>().changeTheme = darkTheme;
          //saves the saved theme as a dark theme
          ProductItems.themeService.saveTheme(ThemeEnums.darkTheme);
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
      );
      //if the theme is dark theme returns light theme button
    } else {
      return TextButton(
        onPressed: () {
          //changes the theme to light theme
          context.read<ThemeChange>().changeTheme = lightTheme;
          //saves the saved theme as a light theme
          ProductItems.themeService.saveTheme(ThemeEnums.lightTheme);
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
      );
    }
  }
}
