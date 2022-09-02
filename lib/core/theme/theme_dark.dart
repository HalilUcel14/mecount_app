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

  final Color kScaffoldBackground = Colors.black87;
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
          background: kScaffoldBackground,
          onBackground: kOnBackground,
          surface: kSurface,
          onSurface: kOnSurface,
        ),
        scaffoldBackgroundColor: kScaffoldBackground,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: customThemeData.textTheme(
          fontFamily: fontFamily,
          color: kOnBackground,
        ),
      );
}
