import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/authentication/i_firebase_auth_manager.dart';
import '../../../../core/routes/app_routes.dart';
import '../../auth/authentication_constants.dart';

part 'verify_viewmodel.g.dart';

class VerifyScreenViewModel = _VerifyScreenViewModelBase
    with _$VerifyScreenViewModel;

abstract class _VerifyScreenViewModelBase with Store, BaseViewModel {
  //
  late final FirebaseAuthManager authManager;
  late final AuthencticationConstants constants;
  final formKey = GlobalKey<FormState>();
  late final FocusNode emailFocus;

  //
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {
    authManager = FirebaseAuthManager.instance;
    isEmailVerified = authManager.currentUser!.emailVerified;
    constants = AuthencticationConstants.instance;
    emailFocus = FocusNode();
    // False ise
    if (!isEmailVerified) {
      sendEmailValid();

      startButtonTimer();
    }
  }

  //
  @observable
  bool buttonClicked = false;
  @observable
  int timer = 60;
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  String emailText = '';
  @observable
  bool isSuccess = false;
  @observable
  bool isEmailVerified = false;
  @observable
  Timer? buttonTimer;

  //
  @action
  Future sendEmailValid() async {
    try {
      await authManager.verifyUserEmail();
    } catch (e) {
      //exceptionMode('$e');
    }
  }

  @action
  Future checkEmailVerified() async {
    await authManager.currentUser!.reload();
    changeEmailVerified();
    if (isEmailVerified) {
      baseContext!.pushNameAndRemoveUntil(AppRoutes.home);
    }
  }

  //
  @action
  void startButtonTimer() {
    buttonClicked = true;
    int buttonSeconds = 60;
    buttonTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      var value = buttonSeconds--;
      if (value == 0) {
        buttonClicked = false;
        buttonTimer?.cancel();
        return;
      }
      buttonTimerChange(value);
    });
  }

  @action
  void changeEmailVerified() =>
      isEmailVerified = authManager.currentUser!.emailVerified;

  @action
  void changeEmailText(String value) => emailText = value;

  @action
  void changeSuccess() => isSuccess = !isSuccess;

  @action
  void changeButtonText(int value) {}

  @action
  void buttonTimerChange(int value) => timer = value;

  @action
  void pressButton() {
    if (!buttonClicked) {
      checkEmailVerified();
      if (!isEmailVerified) {
        sendEmailValid();
        startButtonTimer();
      }
    }
  }
}
