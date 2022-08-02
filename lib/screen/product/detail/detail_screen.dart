import 'package:flutter/material.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../core/firebase/i_firebase_auth_manager.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ElevatedButtonWithStadiumBorder(
              child: const Text('sign out'),
              onPressed: () {
                context.authManager.signOut();
              }),
        ),
      ),
    );
  }
}
