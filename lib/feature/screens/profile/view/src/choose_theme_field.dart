import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/index.dart';
import '../../../../../product/core/base/provider/theme/theme_cubit.dart';
import '../../../../../product/theme/theme_service.dart';
import '../../../../../product/utils/getit/product_items.dart';
import '../../../../../product/utils/translations/locale_keys.g.dart';

final class ChooseThemeField extends StatelessWidget {
  const ChooseThemeField({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: const Icon(Icons.keyboard_double_arrow_down),
      title: Text(LocaleKeys.profile_chooseTheme.tr()),
      children: [
        Wrap(
          children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                if (state.themeMode == ThemeMode.light) {
                  return const _DarkThemeButton();
                }
                return const _LightThemeButton();
              },
            ),
            TextButton(
              onPressed: () {
                //changes the theme as a null
                context.read<ThemeCubit>().changeTheme(ThemeMode.system);
                //revomes the saved theme
                ProductItems.themeService.setRemoveSavedTheme();
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      ColorName.darkThemeColor,
                      ColorName.lightThemeColor,
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
}

final class _LightThemeButton extends StatelessWidget {
  const _LightThemeButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //changes the theme to light theme
        context.read<ThemeCubit>().changeTheme(ThemeMode.light);
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
          color: ColorName.lightThemeColor,
        ),
      ),
    );
  }
}

final class _DarkThemeButton extends StatelessWidget {
  const _DarkThemeButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //changes the theme to dark theme
        context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
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
          color: ColorName.darkThemeColor,
        ),
      ),
    );
  }
}
