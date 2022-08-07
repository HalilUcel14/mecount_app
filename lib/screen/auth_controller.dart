import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/firebase/authentication/i_firebase_auth_manager.dart';
import 'authentication/login/view/login_screen.dart';
import 'product/home/view/home_screen.dart';

class AuthControllerWidget extends StatelessWidget {
  const AuthControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuthManager authManager = FirebaseAuthManager.instance;
    return StreamBuilder(
      stream: authManager.authState,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.data != null) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
