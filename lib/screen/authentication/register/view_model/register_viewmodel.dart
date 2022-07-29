import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/i_firebase_auth_manager.dart';
import '../../../../core/firebase/i_firebase_cloud_firestore_manager.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../product/model/firebase_user_model.dart';
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
        if (emailValid(email: emailText)) {
          // password valid mi
          if (passValid(password: passText)) {
            // user Create
            var data = await authManager.createUserWithEmailAndPassword(
              email: emailText,
              pass: passText,
            );
            // eğer işlem başarı olduysa
            if (data == AuthDataEnum.create) {
              // credential kontrol edilir.
              if (authManager.credential != null) {
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
                // firestore için kullanıcı datası oluşur
                await cloudFirestoreManager.createFirebaseUserData(
                  collectionPath: 'userdata',
                  model: model,
                );
              }
            }
            // eğer user görünüyor ise home ekranına geçiş yapar.
            if (authManager.credential?.user != null) {
              baseContext!.pushNameAndRemoveUntil(AppRoutes.home);
            }
          }
        }
      }
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
    } else if (password.isValidLowPassword) {
      baseContext!.snackbar(errorList: [constants.errorPassNotValid]);
      return false;
    } else {
      return true;
    }
  }
}
