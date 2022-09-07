// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/authentication/i_firebase_auth_manager.dart';
import '../../../../core/firebase/cloud_firestore/i_firebase_cloud_firestore_manager.dart';
import '../../../../core/routes/app_routes.dart';
import '../../auth/auth_function.dart';
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
  final FirebaseCloudFirestoreManager cloudFirestoreManager =
      FirebaseCloudFirestoreManager.instance;
  final ThemeManager themeManager = ThemeManager.instance;
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
  void changeEmailText(String? value) => emailText = value;

  @action
  void changePassText(String? value) => passText = value;

  //

  void buttonPressed() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emailFocus.unfocus();
    passFocus.unfocus();
    //
    if (emailText!.isNullOrEmpty || passText!.isNullOrEmpty) {
      baseContext!.snackbar(
          errorList: [constants.formFieldIsEmpty], labelText: 'Empty Field');

      return;
    }
    if (!AuthenticationFunction.emailValid(
      email: emailText!,
      context: baseContext,
    )) {
      baseContext!.snackbar(errorList: [constants.errorEmailNotValid]);
      return;
    }
    // password valid değilse
    if (!AuthenticationFunction.passValid(
      password: passText!,
      baseContext: baseContext,
    )) {
      baseContext!.snackbar(errorList: [constants.errorPassNotValid]);
      return;
    }
    // sorun kalmadı
    await authManager.signInWithEmailAndPassword(
      email: emailText,
      password: passText,
    );
    // eğer giriş başarısız ise
    if (authManager.currentUser != null) {
      authManager.currentUser!.emailVerified
          ? await baseContext!.pushNameAndRemoveUntil(AppRoutes.home)
          : await baseContext!.pushNamed(AppRoutes.verify);
    } else {
      baseContext!.snackbar(errorList: [constants.loginError]);
    }
  }
}
