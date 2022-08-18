import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/authentication/i_firebase_auth_manager.dart';
import '../../../../core/firebase/cloud_firestore/i_firebase_cloud_firestore_manager.dart';
import '../../auth/auth_function.dart';
import '../../auth/authentication_constants.dart';

part 'forgot_viewmodel.g.dart';

class ForgotScreenViewModel = _ForgotScreenViewModelBase
    with _$ForgotScreenViewModel;

abstract class _ForgotScreenViewModelBase with Store, BaseViewModel {
  //

  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}

  final FirebaseAuthManager authManager = FirebaseAuthManager.instance;
  final FirebaseCloudFirestoreManager cloudFirestoreManager =
      FirebaseCloudFirestoreManager.instance;

  final formKey = GlobalKey<FormState>();
  final AuthencticationConstants constants = AuthencticationConstants.instance;
  final FocusNode emailFocus = FocusNode();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  String emailText = '';

  @observable
  bool isSuccess = false;

  @action
  void changeSuccess() {
    isSuccess = !isSuccess;
  }

  //
  @action
  void changeEmailText(String value) {
    emailText = value;
  }

  void pressButton() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emailFocus.unfocus();
    }
    if (AuthenticationFunction.emailValid(
      email: emailText,
      context: baseContext!,
    )) {
      await authManager.sendPasswordResetEmail(emailText.trim());
      changeSuccess();
    }
  }
}
