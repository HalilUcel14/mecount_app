import 'package:account_app/core/firebase/authentication/i_firebase_auth_manager.dart';
import 'package:account_app/core/firebase/cloud_firestore/i_firebase_cloud_firestore_manager.dart';
import 'package:account_app/screen/authentication/auth/authentication_constants.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

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

  final GlobalKey formkey = GlobalKey<FormState>();
  final AuthencticationConstants constants = AuthencticationConstants.instance;
  final FocusNode emailFocus = FocusNode();

  @observable
  TextEditingController emailController = TextEditingController();

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

  void pressButton() async {
    authManager.sendPasswordResetEmail(emailText!.trim());
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
}
