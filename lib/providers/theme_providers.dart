import 'package:flutter/material.dart';
import '../theme/dark_theme.dart';
import '../theme/light_theme.dart';

class ThemeChange with ChangeNotifier {
  ThemeData themeDark = darkTheme;
  ThemeData themeLight = lightTheme;
  ThemeData? _theme;

  void setThemeAuto(){
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
