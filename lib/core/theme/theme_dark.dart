import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import 'theme_data.dart';

class ThemeDark extends IApplicationTheme {
  static ThemeDark? _instance;
  static ThemeDark get instance {
    _instance ??= ThemeDark._init();
    return _instance!;
  }

  ThemeDark._init();

  final Color kPrimary = Colors.red;
  final Color kOnPrimary = Colors.black;
  final Color kSecondary = Colors.black;
  final Color kOnSecondary = Colors.red;
  final Color kError = Colors.redAccent;
  final Color kOnError = Colors.white;
  final Color kBackground = Colors.black;
  final Color kOnBackground = Colors.yellow;
  final Color kSurface = Colors.white;
  final Color kOnSurface = Colors.red;

  final String fontFamily = 'Roboto';

  final CustomThemeData customThemeData = CustomThemeData();

  @override
  ThemeData? get theme => ThemeData.dark().copyWith(
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
        textTheme: customThemeData.textTheme(
          fontFamily: fontFamily,
          color: kOnBackground,
        ),
      );
}
/*textTheme: customThemeData.textTheme(
          fontFamily: defaultFontFamily,
          color: kOnBackground,
        ), */
