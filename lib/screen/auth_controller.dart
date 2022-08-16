import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/login/view/login_screen.dart';
import 'product/home/view/home_screen.dart';

class AuthControllerWidget extends StatelessWidget {
  const AuthControllerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = context.watch<User?>();
    if (user != null) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
