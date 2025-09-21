import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        centerTitle: true,

      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent
    ),
    fontFamily: GoogleFonts.cairo().fontFamily,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightColor,
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xff7B7B7B))
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xff7B7B7B))

        )
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 14, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
      titleSmall: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent
    ),
    fontFamily: GoogleFonts.cairo().fontFamily,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkColor,
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:  BorderSide(color: AppColors.primaryColor)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:  BorderSide(color: AppColors.primaryColor)

        )
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 14, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
      titleSmall: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
