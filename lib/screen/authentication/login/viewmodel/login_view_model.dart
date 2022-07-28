// ignore_for_file: avoid_print

import 'package:account_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/i_firebase_auth_manager.dart';
import '../../../../core/firebase/i_firebase_cloud_firestore_manager.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../product/model/firebase_user_model.dart';
import '../view/login_constant.dart';

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
  final LoginConstant _loginConstant = LoginConstant.instance;
  final FirebaseAuthManager authManager = FirebaseAuthManager.instance;
  FirebaseCloudFirestoreManager cloudFirestoreManager =
      FirebaseCloudFirestoreManager.instance;
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

  //

  void buttonPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
    if (emailText!.isNotEmpty && passText!.isNotEmpty) {
      if (_emailValid() && _passValid()) {
        // Firebase için Giriş Sağlar
        await authManager.signInWithEmailAndPassword(
          email: emailText,
          pass: passText,
        );
        // Hata Mesajı Gösterir
        baseContext!.snackbar(errorList: [authManager.loginText ?? '']);
      }
      // credential oluşturulmuş ise - Giriş Başarılı ise
      if (authManager.credential != null) {
        var result = await cloudFirestoreManager.getDataIsExists(
          collection: 'userdata',
          documentId: authManager.credential!.user!.uid,
        );
        if (result == DataEnum.notExists) {
          var user = authManager.credential!.user!;
          var model = FirebaseUserModel(
            email: emailText!,
            password: passText,
            displayName: user.displayName,
            emailVerified: user.emailVerified,
            hashCod: user.hashCode,
            isAnonymous: user.isAnonymous,
            phoneNumber: user.phoneNumber,
            photoUrl: user.photoURL,
            refreshToken: user.refreshToken,
            uuid: user.uid,
          );
          //
          await cloudFirestoreManager.createFirebaseUserData(
            collectionPath: 'userdata',
            model: model,
          );
        }
      }

      if (authManager.credential!.user != null) {
        baseContext!.pushNameAndRemoveUntil(AppRoutes.home);
      }
    }
  }

  bool _emailValid() {
    if (!emailText!.isValidEmail) {
      baseContext!.snackbar(errorList: [_loginConstant.errorEmailNotValid]);
      return false;
    }
    return true;
  }

  bool _passValid() {
    if (passText!.length < 8) {
      baseContext!.snackbar(errorList: [_loginConstant.errorPassShort]);
      return false;
    } else if (!passText!.isValidLowPassword) {
      baseContext!.snackbar(errorList: [_loginConstant.errorPassNotValid]);
      return false;
    }
    return true;
  }
}
