import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ThemeDark extends IApplicationTheme {
  static ThemeDark? _instance;
  static ThemeDark get instance {
    _instance ??= ThemeDark._init();
    return _instance!;
  }

  ThemeDark._init();

  @override
  ThemeData? get theme => ThemeData.dark().copyWith(
        // Buraya İstenen Theme Özellikleri Eklenir.
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        textTheme: const TextTheme(),
      );
}
