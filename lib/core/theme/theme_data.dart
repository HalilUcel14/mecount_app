import 'package:flutter/material.dart';

class CustomThemeData {
  TextTheme textTheme({
    required String fontFamily,
    required Color color,
  }) {
    return TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        color: color,
        fontSize: 28,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        color: color,
        letterSpacing: 0.15,
        fontSize: 24,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        color: color,
        letterSpacing: 0.1,
        fontSize: 20,
      ),

      //
      headline1: TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: fontFamily,
        color: color,
        letterSpacing: -1.5,
        fontSize: 96,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: fontFamily,
        color: color,
        letterSpacing: -0.5,
        fontSize: 60,
      ),
      headline3: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        fontSize: 48,
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        fontSize: 34,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        fontSize: 24,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        color: color,
        letterSpacing: 0.15,
        fontSize: 20,
      ),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          color: color,
          fontSize: 16,
          letterSpacing: 0.15),
      subtitle2: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        color: color,
        fontSize: 14,
        letterSpacing: 0.1,
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        fontSize: 64,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        fontSize: 52,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        fontSize: 44,
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        fontSize: 40,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        fontSize: 36,
      ),

      headlineSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        fontSize: 32,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        letterSpacing: 0.5,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
        letterSpacing: 1.25,
        fontSize: 14,
      ),
      button: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        letterSpacing: 1.25,
        color: color,
        fontSize: 14,
      ),
      caption: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        letterSpacing: 1.5,
        color: color,
        fontSize: 10,
      ),
    );
  }
}
