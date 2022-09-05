import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../core/firebase/authentication/i_firebase_auth_manager.dart';
import '../../../../core/routes/app_routes.dart';
import '../view_model/verify_viewmodel.dart';
import 'components/verify_buttons.dart';
import 'components/verify_logo_and_title.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  //
  bool isEmailVerified = false;
  late final FirebaseAuthManager authManager;
  Timer? timer;
  final VerifyScreenViewModel viewModel = VerifyScreenViewModel();

  @override
  void initState() async {
    authManager = FirebaseAuthManager.instance;
    isEmailVerified = authManager.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendEmailValid;
      //
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified,
      );
    }

    //
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await authManager.currentUser!.reload();
    setState(() {
      isEmailVerified = authManager.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  void sendEmailValid() {
    try {
      authManager.verifyUserEmail();
    } catch (e) {
      ''.exceptionMode('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isEmailVerified) {
      context.pushNameAndRemoveUntil(AppRoutes.home);
      return Container();
    } else {
      return Column(
        children: [
          Expanded(child: VerifyLogoAndTitle(viewModel: viewModel)),
          Expanded(child: VerifyButtons(viewModel: viewModel)),
        ],
      );
    }
  }
}
