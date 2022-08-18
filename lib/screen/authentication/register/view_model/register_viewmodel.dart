import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/authentication/firebase_user_model.dart';
import '../../../../core/firebase/authentication/i_firebase_auth_manager.dart';
import '../../../../core/firebase/cloud_firestore/firestore_constants.dart';
import '../../../../core/firebase/cloud_firestore/i_firebase_cloud_firestore_manager.dart';
import '../../../../core/routes/app_routes.dart';
import '../../auth/auth_function.dart';
import '../../auth/authentication_constants.dart';

part 'register_viewmodel.g.dart';

class RegisterScreenViewModel = _RegisterScreenViewModelBase
    with _$RegisterScreenViewModel;

abstract class _RegisterScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;
  @override
  void init() {}

  final AuthencticationConstants constants = AuthencticationConstants.instance;

  final formKey = GlobalKey<FormState>();

  FirebaseAuthManager authManager = FirebaseAuthManager.instance;
  FirebaseCloudFirestoreManager cloudFirestoreManager =
      FirebaseCloudFirestoreManager.instance;

  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passController = TextEditingController();
  @observable
  TextEditingController confirmController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode confirmFocus = FocusNode();

  @observable
  String emailText = '';
  @observable
  String passText = '';
  @observable
  String confirmText = '';

  @action
  void changeEmailText(String value) => emailText = value;

  @action
  void changePassText(String value) => passText = value;

  @action
  void changeConfirmText(String value) => confirmText = value;

  bool get isMatchPass => passText == confirmText ? true : false;

  bool get isNotEmpty {
    if (emailText.isNotEmpty && passText.isNotEmpty && confirmText.isNotEmpty) {
      return true;
    }
    return false;
  }

  void registerPressed() async {
    formKey.currentState!.save();
    // Klavye Focus Kapatma.
    emailFocus.unfocus();
    passFocus.unfocus();
    confirmFocus.unfocus();
    // bölümler boş mu
    if (isNotEmpty) {
      // password eşleşiyor mu
      if (isMatchPass) {
        // email valid var mı
        if (AuthenticationFunction.emailValid(
            context: baseContext!, email: emailText)) {
          // password valid mi
          if (AuthenticationFunction.passValid(
              password: passText, baseContext: baseContext)) {
            // user Create
            await authManager.createUserWithEmailAndPassword(
              email: emailText,
              password: passText,
            );
            baseContext!.snackbar(errorList: [authManager.loginCatchError]);
            // credential kontrol edilir.
            if (authManager.currentUser != null) {
              var user = authManager.currentUser!;
              bool isMobile = Platform.isIOS || Platform.isAndroid;
              var model = FirebaseUserModel(
                email: emailText,
                displayName: user.displayName,
                emailVerified: user.emailVerified,
                hashCod: user.hashCode,
                isAnonymous: user.isAnonymous,
                phoneNumber: user.phoneNumber,
                photoUrl: user.photoURL,
                refreshToken: user.refreshToken,
                uuid: user.uid,
                isMobileOnline: isMobile ? true : null,
                isWebOnline: isMobile ? null : true,
              );
              // firestore için kullanıcı datası oluşur
              await cloudFirestoreManager.createFirebaseUserData(
                collectionPath: CloudFirestoreConstants.instance.userData,
                model: model,
              );
            }

            // eğer user görünüyor ise home ekranına geçiş yapar.
            if (authManager.currentUser != null) {
              baseContext!.pushNameAndRemoveUntil(AppRoutes.home);
            }
          } else {
            baseContext!.snackbar(errorList: [constants.errorPassNotValid]);
          }
        } else {
          baseContext!.snackbar(errorList: [constants.errorEmailNotValid]);
        }
      } else {
        baseContext!.snackbar(errorList: [constants.errorConfirmPass]);
      }
    } else {
      baseContext!.snackbar(errorList: [constants.formFieldIsEmpty]);
    }
  }
}
