// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/authentication/i_firebase_auth_manager.dart';
import '../../../../core/firebase/cloud_firestore/i_firebase_cloud_firestore_manager.dart';
import '../../auth/authentication_constants.dart';

part 'login_view_model.g.dart';

class LoginScreenViewModel = _LoginScreenViewModelBase
    with _$LoginScreenViewModel;

abstract class _LoginScreenViewModelBase with Store, BaseViewModel {
  //

  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}

  //
  final FirebaseAuthManager authManager = FirebaseAuthManager.instance;
  FirebaseCloudFirestoreManager cloudFirestoreManager =
      FirebaseCloudFirestoreManager.instance;
  ThemeManager themeManager = ThemeManager.instance;
  //
  final formKey = GlobalKey<FormState>();
  final AuthencticationConstants constants = AuthencticationConstants.instance;
  final FocusNode emailFocus = FocusNode();
  final FocusNode passFocus = FocusNode();

  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passController = TextEditingController();

  @observable
  String? emailText = '';
  @observable
  String? passText = '';
  //
  @action
  void changeEmailText(String? value) {
    emailText = value;
  }

  @action
  void changePassText(String? value) {
    passText = value;
  }

  //

  void buttonPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emailFocus.unfocus();
      passFocus.unfocus();
    }
    if (emailText!.isNotEmpty && passText!.isNotEmpty) {
      if (emailValid(email: emailText!) && passValid(password: passText!)) {
        // Firebase için Giriş Sağlar
        await authManager.signInWithEmailAndPassword(
          email: emailText,
          password: passText,
        );
        // Hata Mesajı Gösterir
        baseContext!.snackbar(errorList: [authManager.loginCatchError]);
      }
    } else {
      baseContext!.snackbar(errorList: [constants.formFieldIsEmpty]);
    }
  }

  bool emailValid({required String email}) {
    if (!email.isValidEmail) {
      baseContext!.snackbar(errorList: [constants.errorEmailNotValid]);
      return false;
    } else if (email.length > 100) {
      baseContext!.snackbar(errorList: [constants.errorEmailLong]);
      return false;
    } else {
      return true;
    }
  }

  bool passValid({required String password}) {
    if (password.length < 8) {
      baseContext!.snackbar(errorList: [constants.errorPassShort]);
      return false;
    } else if (password.length > 100) {
      baseContext!.snackbar(errorList: [constants.errorPassLong]);
      return false;
    } else if (!password.isValidLowPassword) {
      baseContext!.snackbar(errorList: [constants.errorPassNotValid]);
      return false;
    } else {
      return true;
    }
  }
}
