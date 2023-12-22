// ignore_for_file: avoid_setters_without_getters

import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/product/theme/dark_theme.dart';
import 'package:siparis_takip_sistemi_pro/product/theme/light_theme.dart';

class ThemeChange with ChangeNotifier {
  ThemeData themeDark = darkTheme;
  ThemeData themeLight = lightTheme;
  ThemeData? _theme;

  void setThemeAuto() {
    _theme = null;
    notifyListeners();
  }

  ThemeData? get getTheme {
    return _theme;
  }

  set changeTheme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }
}
