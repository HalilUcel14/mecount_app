import 'package:account_app/screen/authentication/login/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/i_firebase_auth_manager.dart';
import '../../../../core/routes/app_routes.dart';
import '../view/login_constant.dart';

part 'login_view_model.g.dart';

class LoginScreenViewModel = _LoginScreenViewModelBase
    with _$LoginScreenViewModel;

abstract class _LoginScreenViewModelBase with Store, BaseViewModel {
  //

  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {
    authManager = FirebaseAuthManager.instance;
  }

  //
  late FirebaseAuthManager authManager;
  final formKey = GlobalKey<FormState>();

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

  void buttonPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
    if (emailText!.isNotEmpty && passText!.isNotEmpty) {
      if (_emailValid() && _passValid()) {
        await authManager.signInWithEmailAndPassword(
          email: emailText,
          pass: passText,
        );
        var user = authManager.auth.currentUser;
        if (user != null) {
          //
          authManager.changeModelUser(
            model: LoginModel(
              email: emailText,
              password: passText,
              displayName: user.displayName,
              emailVerified: user.emailVerified,
              hashCod: user.hashCode,
              isAnonymous: user.isAnonymous,
              phoneNumber: user.phoneNumber,
              photoUrl: user.photoURL,
              refreshToken: user.refreshToken,
              uuid: user.uid,
            ),
          );
          print(user.displayName);
          Navigator.pushNamedAndRemoveUntil(
            baseContext!,
            AppRoutes.home,
            (route) => false,
          );
        }
      }
    }
  }

  final LoginConstant _loginConstant = LoginConstant.instance;

  bool _emailValid() {
    if (!emailText!.contains(_loginConstant.emailMustContain)) {
      print(_loginConstant.errorEmailContain);
      return false;
    } else if (!emailText!.isValidEmail) {
      print(_loginConstant.errorEmailNotValid);
      return false;
    }
    return true;
  }

  bool _passValid() {
    if (passText!.length < 8) {
      print(_loginConstant.errorPassShort);
      return false;
    } else if (!passText!.isValidLowPassword) {
      print(_loginConstant.errorPassNotValid);
      return false;
    }
    return true;
  }
}
