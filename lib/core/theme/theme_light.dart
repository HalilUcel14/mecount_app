import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ThemeLight extends IApplicationTheme {
  static ThemeLight? _instance;
  static ThemeLight get instance {
    _instance ??= ThemeLight._init();
    return _instance!;
  }

  ThemeLight._init();

  @override
  ThemeData? get theme => ThemeData.light().copyWith(
        // Buraya İstenen Theme Özellikleri Eklenir.
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      );
}
