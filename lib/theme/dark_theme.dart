import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
      onTertiary: Color.fromARGB(255, 166, 166, 166),),
  //Text
  cardTheme: CardTheme(
      elevation: 5,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),),
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
              borderRadius: BorderRadius.circular(2),),),),
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
    foregroundColor: const Color.fromARGB(255, 210, 210, 210),
  ),),
  appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Color.fromARGB(255, 210, 210, 210),
      ),),
      elevation: 2,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black,),
);
