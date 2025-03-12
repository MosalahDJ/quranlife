import 'package:flutter/material.dart';
import 'package:project/core/Utils/constants.dart';
import 'package:get/get.dart';

String get _fontFamily =>
    Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Poppins-Black';

class Themes {
  // Light Theme Configuration
  ThemeData lightmode = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: kmaincolor3,

      // Core Colors
      primaryColor: kmaincolor,
      cardColor: textcolor2,
      dividerColor: kmaincolor4,

      // Component Themes
      appBarTheme: AppBarTheme(backgroundColor: kmaincolor),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: kmaincolor3),
      buttonTheme: ButtonThemeData(
        buttonColor: kmaincolor4,
        hoverColor: kmaincolor3,
      ),
      iconTheme: IconThemeData(color: textcolor2, size: 25),

      // Typography
      textTheme: TextTheme(
        headlineLarge: TextStyle(
            fontSize: 32, color: kmaincolor, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
            fontSize: 24, color: textcolor2, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            fontSize: 22,
            color: textcolor3,
            fontWeight: FontWeight.bold,
            fontFamily: _fontFamily),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textcolor3,
          fontFamily: _fontFamily,
        ),
        bodyMedium: TextStyle(
            fontSize: 14,
            color: textcolor3,
            fontWeight: FontWeight.bold,
            fontFamily: _fontFamily),
        labelLarge: TextStyle(
            fontSize: 14, color: hintcolor, fontWeight: FontWeight.bold),
      ), dialogTheme: DialogThemeData(backgroundColor: kmaincolor3));

  // Dark Theme Configuration
  ThemeData darkmode = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: kmaincolor3dark,

      // Core Colors
      primaryColor: kmaincolordark,
      cardColor: kmaincolor2dark,
      dividerColor: kmaincolor4dark,

      // Component Themes
      appBarTheme: AppBarTheme(backgroundColor: kmaincolor),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: kmaincolor3dark),
      buttonTheme: ButtonThemeData(
        buttonColor: kmaincolor4dark,
        hoverColor: kmaincolor3dark,
      ),
      iconTheme: IconThemeData(color: textcolor2dark, size: 25),

      // Typography
      textTheme: TextTheme(
        headlineLarge: TextStyle(
            fontSize: 32, color: kmaincolordark, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
            fontSize: 24, color: textcolor2dark, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: _fontFamily),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textcolor3dark,
          fontFamily: _fontFamily,
        ),
        bodyMedium: TextStyle(
            fontSize: 14,
            color: textcolor3dark,
            fontWeight: FontWeight.bold,
            fontFamily: _fontFamily),
        labelLarge: TextStyle(
            fontSize: 14, color: textcolordark, fontWeight: FontWeight.bold),
      ), dialogTheme: DialogThemeData(backgroundColor: kmaincolor3dark));
}
