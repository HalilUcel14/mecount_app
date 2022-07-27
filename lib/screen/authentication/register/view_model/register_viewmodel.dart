import 'package:account_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/i_firebase_auth_manager.dart';
import '../../../../core/firebase/i_firebase_cloud_firestore_manager.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../product/model/firebase_user_model.dart';
import '../view/register_constant.dart';

part 'register_viewmodel.g.dart';

class RegisterScreenViewModel = _RegisterScreenViewModelBase
    with _$RegisterScreenViewModel;

abstract class _RegisterScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;
  @override
  void init() {
    authManager = FirebaseAuthManager.instance;
  }

  final RegisterConstant constant = RegisterConstant.instance;
  final formKey = GlobalKey<FormState>();

  late FirebaseAuthManager authManager;
  FirebaseCloudFirestoreManager cloudFirestoreManager =
      FirebaseCloudFirestoreManager.instance;

  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passController = TextEditingController();
  @observable
  TextEditingController confirmController = TextEditingController();

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

    if (isNotEmpty) {
      if (isMatchPass) {
        if (!emailText.isValidEmail) {
          baseContext!.snackbar(errorList: [constant.errorEmailNotValid]);
        } else if (!passText.isValidLowPassword || passText.length < 8) {
          baseContext!.snackbar(errorList: [
            constant.errorPassNotValid,
            constant.errorPassShort,
          ]);
        } else {
          // Kullanıcı oluşturma ve sayfa geçiş
          await authManager.createUserWithEmailAndPassword(
            email: emailText,
            pass: passText,
          );
          if (authManager.loginText == 'User Create is Successfully') {
            if (authManager.credential != null) {
              var result = await cloudFirestoreManager.getDataIsExists(
                collection: 'userdata',
                documentId: authManager.credential!.user!.uid,
              );
              if (result == DataEnum.notExists) {
                var user = authManager.credential!.user!;
                var model = FirebaseUserModel(
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
                );

                await cloudFirestoreManager.createFirebaseUserData(
                  collectionPath: 'userdata',
                  model: model,
                );
              }
              if (authManager.currentUser != null) {
                baseContext!.pushNameAndRemoveUntil(AppRoutes.home);
              }
            }
          } else {
            baseContext!.snackbar(errorList: [authManager.loginText!]);
          }
        }
      } else {
        baseContext!.snackbar(errorList: [constant.errorMatchPass]);
      }
    } else {
      baseContext!.snackbar(errorList: [constant.errorEmptyField]);
    }
  }
}
