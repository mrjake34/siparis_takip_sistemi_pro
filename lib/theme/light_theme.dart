import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Rubik',
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    //Main Text
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
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ),
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
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 87, 92, 107),
    ),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.aBeeZee(
      textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
    elevation: 2,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.black,
  ),
);
