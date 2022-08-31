import 'package:account_app/core/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:provider/provider.dart';

class ConsumerFirebaseUserProvider extends StatelessWidget {
  const ConsumerFirebaseUserProvider(
      {Key? key, required this.childWidget, this.nullWidget})
      : super(key: key);

  final Widget childWidget;
  final Widget? nullWidget;

  @override
  Widget build(BuildContext context) {
    return Consumer<User?>(builder: (context, User? user, child) {
      return user == null ? nullWidget ?? _nullUserChild(context) : childWidget;
    });
  }

  Widget _nullUserChild(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('is User Null Value or Not Auth User'),
          ElevatedButton(
              onPressed: () {
                context.pushNameAndRemoveUntil(AppRoutes.login);
              },
              child: const Text('Login Page')),
        ],
      ),
    );
  }
}
