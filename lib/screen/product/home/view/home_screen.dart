import 'package:flutter/material.dart';

import '../../../../core/firebase/i_firebase_auth_manager.dart';
import '../../../../core/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () async {
              await FirebaseAuthManager.instance.signOuth();
              await Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.login, (route) => false);
            },
            child: const Text("Sing Out")),
      ),
    );
  }
}
