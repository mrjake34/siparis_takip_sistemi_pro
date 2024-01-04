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
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 87, 92, 107),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 2, 34, 128),
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      minimumSize: const Size(300, 40),
      fixedSize: const Size(300, 40),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 2, 34, 128),
      textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.baloo2(
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
