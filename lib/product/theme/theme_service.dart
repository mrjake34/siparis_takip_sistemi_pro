// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siparis_takip_sistemi_pro/product/theme/dark_theme.dart';
import 'package:siparis_takip_sistemi_pro/product/theme/light_theme.dart';

final class ThemeService {
  const ThemeService._();

  static const ThemeService _instance = ThemeService._();

  static ThemeService get instance => _instance;

  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  //This function returns a ThemeData or null
  Future<ThemeData?> getThemeFromSave() async {
    final preferences = await _prefs;
    //we getting saved value
    final theme = preferences.getString(ThemeEnums.theme.name);
    //if theme veriable is not null, will return value which theme chosen
    if (theme != null) {
      switch (theme) {
        case 'lightTheme':
          return lightTheme;
        case 'darkTheme':
          return darkTheme;
      }
    }
    //if theme veriable is null, returns null value
    return null;
  }

  //this function saves chosen theme option
  Future<void> saveTheme(ThemeEnums value) async {
    final preferences = await _prefs;
    await preferences.setString(ThemeEnums.theme.name, value.name);
  }

  //this function clears saved theme value
  Future<void> setRemoveSavedTheme() async {
    final preferences = await _prefs;
    await preferences.remove(ThemeEnums.theme.name);
  }
}

//Theme Enums
enum ThemeEnums { theme, lightTheme, darkTheme }
