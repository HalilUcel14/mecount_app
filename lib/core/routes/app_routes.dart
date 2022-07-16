import 'package:flutter/material.dart';

import '../../screen/authentication/login/view/login_screen.dart';
import '../../screen/authentication/onboard/view/onboard_screen.dart';
import '../../screen/authentication/register/view/register_screen.dart';
import '../../screen/product/home/view/home_screen.dart';

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
  static const String register = '/register';
  static const String home = '/home';

  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    initRoute: (context) => const Scaffold(),
    onboard: (context) => OnBoardScreen(),
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
    register: (context) => RegisterScreen(),
  };
}
