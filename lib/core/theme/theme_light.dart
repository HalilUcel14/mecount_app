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

  final Color kPrimary = Colors.red;
  final Color kOnPrimary = Colors.black;
  final Color kSecondary = Colors.black;
  final Color kOnSecondary = Colors.red;
  final Color kError = Colors.redAccent;
  final Color kOnError = Colors.white;
  final Color kBackground = Colors.white;
  final Color kOnBackground = Colors.black87;
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
          background: kBackground,
          onBackground: kOnBackground,
          surface: kSurface,
          onSurface: kOnSurface,
        ),
        scaffoldBackgroundColor: kBackground,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textButtonTheme: const TextButtonThemeData(),
        textTheme: customThemeData.textTheme(
          fontFamily: defaultFontFamily,
          color: kOnBackground,
        ),
      );
}
