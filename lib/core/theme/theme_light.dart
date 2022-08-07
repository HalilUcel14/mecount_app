import 'package:account_app/core/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ThemeLight extends IApplicationTheme {
  static ThemeLight? _instance;
  static ThemeLight get instance {
    _instance ??= ThemeLight._init();
    return _instance!;
  }

  ThemeLight._init();

  final Color kScaffoldBackground = Colors.white;
  final Color kPrimary = 'D74701'.color;
  final Color kPrimaryLight = 'FF854B'.color;
  final Color kPrimaryDark = 'A93700'.color;
  final Color kSecondary = 'FF6820'.color;
  final Color kOnPrimary = Colors.black;
  final Color kOnSecondary = Colors.white;

  final Color kError = Colors.redAccent;
  final Color kOnError = Colors.white;

  final Color kOnBackground = Colors.yellow;
  final Color kSurface = Colors.white;
  final Color kOnSurface = Colors.red;

  final String defaultFontFamily = 'Roboto';

  final CustomThemeData customThemeData = CustomThemeData();

  @override
  ThemeData? get theme => ThemeData.light().copyWith(
        // Buraya İstenen Theme Özellikleri Eklenir.
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: kPrimary,
          onPrimary: kOnPrimary,
          secondary: kSecondary,
          onSecondary: kOnSecondary,
          error: kError,
          onError: kOnError,
          background: kScaffoldBackground,
          onBackground: kOnBackground,
          surface: kSurface,
          onSurface: kOnSurface,
        ),
        //
        primaryColor: kPrimary,
        primaryColorLight: kPrimaryLight,
        primaryColorDark: kPrimaryDark,
        //
        scaffoldBackgroundColor: kScaffoldBackground,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            animationDuration: const Duration(milliseconds: 300),
            foregroundColor: MaterialStateProperty.all(kOnPrimary),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: defaultFontFamily,
              ),
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: kPrimary,
          shape: const StadiumBorder(),
        ),
        textTheme: customThemeData.textTheme(
          fontFamily: defaultFontFamily,
          color: kOnPrimary,
        ),
      );
}
