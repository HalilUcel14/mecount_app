import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:provider/provider.dart';

import 'theme_dark.dart';
import 'theme_light.dart';

//
// Provider için theme izlemesine yarayan extension code Context ile çalışır
//
extension ThemeContextExtension on BuildContext {
  ThemeData get themeProvider => watch<ThemeManager>().currentTheme;
}

class ThemeManager extends ChangeNotifier implements IThemeManager {
  static ThemeManager? _instance;
  static ThemeManager get instance {
    _instance ??= ThemeManager._init();
    return _instance!;
  }

  ThemeManager._init();

  @override
  ThemeEnum currentEnum = ThemeEnum.LIGHT;

  @override
  ThemeData currentTheme = ThemeEnum.LIGHT.generateTheme(
    darkTheme: ThemeDark.instance.theme!,
    lightTheme: ThemeLight.instance.theme!,
  );

  @override
  void changeTheme(ThemeEnum themes) {
    if (themes != currentEnum) {
      currentTheme = themes.generateTheme(
        darkTheme: ThemeDark.instance.theme!,
        lightTheme: ThemeLight.instance.theme!,
      );
      currentEnum = themes;
      notifyListeners();
    }
    return;
  }
}
