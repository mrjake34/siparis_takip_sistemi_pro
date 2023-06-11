// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Rubik',
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 0, 0, 0),
    //Buttons Text and userInteractive
    onPrimary: Color.fromARGB(255, 2, 34, 128),
    secondary: Color.fromARGB(255, 255, 255, 255),
    onSecondary: Color.fromARGB(255, 255, 255, 255),
    error: Colors.red,
    onError: Colors.redAccent,
    background: Color.fromARGB(255, 242, 242, 242),
    //Scaffold Background
    onBackground: Colors.white,
    //Scaffold Color and Cards
    surface: Color.fromARGB(255, 242, 242, 242),
    onSurface: Color.fromARGB(255, 0, 0, 0),
    //
    tertiary: Color.fromARGB(255, 255, 255, 255),
    onTertiary: Color.fromARGB(255, 255, 255, 255),
  ),
  cardTheme: CardTheme(
      elevation: 5,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: const Color.fromARGB(255, 73, 84, 100),
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFF495464),
          disabledForegroundColor: const Color.fromARGB(255, 255, 255, 255),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0)))),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: const Color.fromARGB(255, 87, 92, 107),
  )),
  appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
      elevation: 2.0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black),
);
ThemeData darkTheme = ThemeData(
  fontFamily: 'Rubik',
  useMaterial3: true,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      //Buttons Text and userInteractive
      primary: Color.fromARGB(255, 238, 238, 238),
      onPrimary: Color.fromARGB(255, 166, 166, 166),
      secondary: Color.fromARGB(255, 166, 166, 166),
      onSecondary: Color.fromARGB(255, 166, 166, 166),
      error: Color.fromARGB(255, 255, 28, 28),
      onError: Color.fromARGB(255, 255, 49, 49),
      //Scaffold Background
      background: Color(0xFF393E46),
      onBackground: Color.fromARGB(255, 166, 166, 166),
      //Appbar Color and Cards
      surface: Color(0xFF222831),
      onSurface: Colors.white70,
      //Card Text
      tertiary: Color.fromARGB(255, 159, 159, 159),
      onTertiary: Color.fromARGB(255, 166, 166, 166)),
  //Text
  cardTheme: CardTheme(
      elevation: 5,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          foregroundColor: const Color.fromARGB(255, 238, 238, 238),
          surfaceTintColor: Colors.transparent,
          backgroundColor: const Color.fromARGB(255, 214, 90, 49),
          disabledBackgroundColor: const Color.fromARGB(255, 214, 90, 49),
          disabledForegroundColor: const Color.fromARGB(255, 238, 238, 238),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0)))),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: const Color.fromARGB(255, 210, 210, 210),
  )),
  appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Color.fromARGB(255, 210, 210, 210),
      )),
      elevation: 2.0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black),
);

ThemeData theme3 = ThemeData(
  fontFamily: 'Rubik',
  useMaterial3: true,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      //Buttons Text and userInteractive
      primary: Color.fromARGB(255, 211, 211, 211),
      onPrimary: Color.fromARGB(255, 211, 211, 211),
      secondary: Color.fromARGB(255, 211, 211, 211),
      onSecondary: Color.fromARGB(255, 211, 211, 211),
      error: Colors.red,
      onError: Colors.redAccent,
      //Scaffold Background
      background: Color.fromARGB(255, 25, 25, 25),
      //Background Widgets
      onBackground: Color.fromARGB(255, 211, 211, 211),
      //Appbar Color and Cards
      surface: Color.fromARGB(255, 187, 187, 187),
      //Card Text
      onSurface: Color.fromARGB(255, 211, 211, 211),
      tertiary: Color.fromARGB(255, 211, 211, 211),
      //Text
      onTertiary: Colors.pink),
  cardTheme: CardTheme(
      color: const Color.fromARGB(255, 210, 218, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: const Color.fromARGB(255, 26, 95, 122),
          foregroundColor: Colors.white,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0)))),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: Colors.white,
  )),
  appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
      elevation: 2.0,
      shadowColor: Colors.black),
);
ThemeData theme4 = ThemeData(
  fontFamily: 'Rubik',
  useMaterial3: true,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      //Buttons Text and userInteractive
      primary: Colors.white,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.white,
      onError: Colors.white,
      //Scaffold Background
      background: Color.fromARGB(255, 53, 47, 68),
      //Background Widgets
      onBackground: Colors.white,
      //Scaffold Color and Cards
      surface: Color.fromARGB(255, 42, 36, 56),
      //Card Text
      onSurface: Colors.white,
      tertiary: Colors.white,
      //Text
      onTertiary: Colors.pink),
  cardTheme: CardTheme(
      //color: const Color.fromARGB(255, 255,213,11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 78, 49, 170),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0)))),
  textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0)))),
  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: Colors.white,
  )),
  appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
      elevation: 2.0,
      shadowColor: Colors.black),
);
ThemeData theme5 = ThemeData(
  fontFamily: 'Rubik',
  useMaterial3: true,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      //Buttons Text and userInteractive
      primary: Colors.white,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.redAccent,
      //Scaffold Background
      background: Color.fromARGB(255, 37, 29, 58),
      //Background Widgets
      onBackground: Colors.white,
      //Scaffold Color and Cards
      surface: Color.fromARGB(255, 42, 37, 80),
      //Card Text
      onSurface: Colors.white,
      tertiary: Colors.white,
      //Text
      onTertiary: Colors.pink),
  cardTheme: CardTheme(
      color: const Color.fromARGB(255, 38, 58, 41),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.abel(
            textStyle: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 232, 106, 51),
        side: BorderSide.none,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0))),
  ),
  textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0)))),
  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: Colors.white,
  )),
  appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.aBeeZee(
          textStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      elevation: 2.0,
      shadowColor: Colors.black),
);

class ThemeChange with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ThemeData themeDark = darkTheme;
  ThemeData themeLight = lightTheme;
  ThemeData? _theme = lightTheme;

  Future getThemeFromSave() async {
    final SharedPreferences preferences = await _prefs;
    String? theme = preferences.getString("theme");

    if (theme!.isNotEmpty) {
      if (theme == "lightTheme") {
        return _theme = lightTheme;
      } else if (theme == "darkTheme") {
        return _theme = darkTheme;
      } else if (theme == "coldTheme") {
        return _theme = theme3;
      } else if (theme == "orangeTheme") {
        return _theme = theme4;
      } else if (theme == "greenTheme") {
        return _theme = theme5;
      } else {
        return _theme = lightTheme;
      }
    }
  }

  ThemeData get getTheme {
    return _theme!;
  }

  Future saveTheme(String value) async {
    final SharedPreferences preferences = await _prefs;
    preferences.setString("theme", value);
  }

  set changeTheme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }
}
