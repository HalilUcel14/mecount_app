import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/i_firebase_auth_manager.dart';
import '../../../../core/firebase/i_firebase_cloud_firestore_manager.dart';
import '../view/register_constant.dart';

part 'register_viewmodel.g.dart';

class RegisterScreenViewModel = _RegisterScreenViewModelBase
    with _$RegisterScreenViewModel;

abstract class _RegisterScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;
  @override
  void init() {}

  final RegisterConstant constant = RegisterConstant.instance;
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

  bool isMatchPass() => passText == confirmText ? true : false;

  bool isNotEmpty() {
    if (emailText.isNotEmpty && passText.isNotEmpty && confirmText.isNotEmpty) {
      return true;
    }
    return false;
  }
}
