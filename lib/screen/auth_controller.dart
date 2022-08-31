import 'package:account_app/core/widget/consumer_firebase_user_provider.dart';
import 'package:flutter/material.dart';

import 'authentication/login/view/login_screen.dart';
import 'product/home/view/home_screen.dart';

class AuthControllerWidget extends StatelessWidget {
  const AuthControllerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConsumerFirebaseUserProvider(
      childWidget: HomeScreen(),
      nullWidget: LoginScreen(),
    );

    // final User? user = context.watch<User?>();
    // if (user != null) {
    //   return HomeScreen();
    // } else {
    //   return LoginScreen();
    // }
  }
}
