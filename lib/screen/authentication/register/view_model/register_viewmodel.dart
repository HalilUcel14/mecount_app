import 'package:account_app/core/firebase/cloud_firestore/firestore_constants.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/authentication/firebase_user_model.dart';
import '../../../../core/firebase/authentication/i_firebase_auth_manager.dart';
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

  final FirebaseAuthManager authManager = FirebaseAuthManager.instance;
  final FirebaseCloudFirestoreManager cloudFirestoreManager =
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
  String emailText = '', passText = '', confirmText = '';

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
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    // Klavye Focus Kapatma.
    emailFocus.unfocus();
    passFocus.unfocus();
    confirmFocus.unfocus();

    // bölümler boş mu
    if (!isNotEmpty) {
      baseContext!.snackbar(errorList: [constants.formFieldIsEmpty]);
      return;
    }
    if (!isMatchPass) {
      baseContext!.snackbar(errorList: [constants.errorConfirmPass]);
      return;
    }
    if (!AuthenticationFunction.emailValid(
        email: emailText, context: baseContext)) {
      baseContext!.snackbar(errorList: [constants.errorEmailNotValid]);
      return;
    }
    if (!AuthenticationFunction.passValid(
        password: passText, baseContext: baseContext)) {
      baseContext!.snackbar(errorList: [constants.errorPassNotValid]);
      return;
    }
    await authManager.createUserWithEmailAndPassword(
      email: emailText,
      password: passText,
    );
    baseContext!.snackbar(errorList: [authManager.loginCatchError]);
    if (authManager.currentUser == null) {
      baseContext!.snackbar(errorList: [constants.registerError]);
      return;
    }
    var user = authManager.currentUser!;
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
      isMobileOnline: baseContext!.isMobile ? true : null,
      isWebOnline: baseContext!.isMobile ? null : true,
    );
    await cloudFirestoreManager.createFirebaseUserData(
      collectionPath: CloudFirestoreConstants.instance.userData,
      model: model,
    );
    if (authManager.currentUser != null) {
      authManager.currentUser!.emailVerified
          ? await baseContext!.pushNameAndRemoveUntil(AppRoutes.home)
          : await baseContext!.pushNameAndRemoveUntil(AppRoutes.verify);
    } else {
      baseContext!.snackbar(errorList: [constants.loginError]);
    }
  }
}
