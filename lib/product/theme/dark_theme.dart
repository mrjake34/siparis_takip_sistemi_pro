import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Rubik',
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    //Buttons Text and userInteractive
    primary: Color.fromARGB(255, 166, 166, 166),
    onPrimary: Color.fromARGB(255, 166, 166, 166),
    secondary: Color.fromARGB(255, 7, 40, 189),
    onSecondary: Color.fromARGB(255, 166, 166, 166),
    error: Color.fromARGB(255, 255, 28, 28),
    onError: Color.fromARGB(255, 255, 49, 49),
    //Scaffold Background
    background: Color(0xFF393E46),
    onBackground: Color.fromARGB(255, 166, 166, 166),
    //Appbar Color and Cards
    surface: Color.fromARGB(255, 48, 52, 59),
    onSurface: Color.fromARGB(255, 238, 238, 238),
    //Card Text
    tertiary: Color.fromARGB(255, 163, 1, 1),
    onTertiary: Color.fromARGB(255, 166, 166, 166),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 3, 42, 160),
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
      foregroundColor: const Color.fromARGB(255, 87, 107, 167),
      textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.baloo2(
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Color.fromARGB(255, 210, 210, 210),
      ),
    ),
    elevation: 2,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.black,
  ),
);
