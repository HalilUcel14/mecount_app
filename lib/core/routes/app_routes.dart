import 'package:account_app/screen/authentication/login/view/login_screen.dart';
import 'package:account_app/screen/authentication/onboard/view/onboard_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static AppRoutes? _instance;
  static AppRoutes get instance {
    _instance ??= AppRoutes._init();
    return _instance!;
  }

  AppRoutes._init();

  static const String initRoute = '/';
  static const String onboard = '/onboard';
  static const String login = '/login';

  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    initRoute: (context) => const Scaffold(),
    onboard: (context) => OnBoardScreen(),
    login: (context) => const LoginScreen(),
  };
}
