// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/theme/dark_theme.dart';
import 'package:siparis_takip_sistemi_pro/theme/light_theme.dart';

class ThemeService with BaseModelView {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<ThemeData?> getThemeFromSave() async {
    final preferences = await _prefs;
    final theme = preferences.getString('theme');
    if (theme?.isNotEmpty ?? false) {
      switch (theme) {
        case 'lightTheme':
          return lightTheme;
        case 'darkTheme':
          return darkTheme;
      }
    }
    return null;
  }

  void saveTheme(ThemeEnums value) {
    sharedManager.setStringValue(PreferenceKey.theme, value.name);
  }

  void setRemoveSavedTheme() {
    sharedManager.removeFromKey(PreferenceKey.theme);
  }
}
