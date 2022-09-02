import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../main.dart';
import '../../auth/auth_function.dart';
import '../../auth/authentication_constants.dart';

part 'verify_viewmodel.g.dart';

class VerifyScreenViewModel = _VerifyScreenViewModelBase
    with _$VerifyScreenViewModel;

abstract class _VerifyScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}

  final AuthencticationConstants constants = AuthencticationConstants.instance;
  final formKey = GlobalKey<FormState>();
  final FocusNode emailFocus = FocusNode();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  String emailText = '';
  @observable
  bool isSuccess = false;

  @action
  void changeEmailText(String value) => emailText = value;
  @action
  void changeSuccess() => isSuccess = !isSuccess;

  @action
  void pressButton() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emailFocus.unfocus();
    //
    if (!AuthenticationFunction.emailValid(
      context: baseContext,
      email: emailText.trim(),
    )) {
      baseContext!.snackbar(errorList: [constants.errorEmailNotValid]);
      return;
    }
    await authManager.verifyUserEmail();
    changeSuccess();
  }
}

// if (!formKey.currentState!.validate()) return;
//     formKey.currentState!.save();
//     emailFocus.unfocus();
//     //
//     if (!AuthenticationFunction.emailValid(
//       email: emailText.trim(),
//       context: baseContext!,
//     )) {
//       baseContext!.snackbar(errorList: [constants.errorEmailNotValid]);
//       return;
//     }
//     //
//     await authManager.sendPasswordResetEmail(emailText.trim());
//     changeSuccess();