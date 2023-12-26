part of 'profile_page.dart';

final class _ChooseThemeField extends StatelessWidget {
  const _ChooseThemeField();

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
                      AppColors.darkThemeColor,
                      AppColors.lightThemeColor,
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
          color: AppColors.lightThemeColor,
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
          color: AppColors.darkThemeColor,
        ),
      ),
    );
  }
}
