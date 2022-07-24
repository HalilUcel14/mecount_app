// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterScreenViewModel on _RegisterScreenViewModelBase, Store {
  late final _$authManagerAtom =
      Atom(name: '_RegisterScreenViewModelBase.authManager', context: context);

  @override
  FirebaseAuthManager get authManager {
    _$authManagerAtom.reportRead();
    return super.authManager;
  }

  @override
  set authManager(FirebaseAuthManager value) {
    _$authManagerAtom.reportWrite(value, super.authManager, () {
      super.authManager = value;
    });
  }

  late final _$emailControllerAtom = Atom(
      name: '_RegisterScreenViewModelBase.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$passControllerAtom = Atom(
      name: '_RegisterScreenViewModelBase.passController', context: context);

  @override
  TextEditingController get passController {
    _$passControllerAtom.reportRead();
    return super.passController;
  }

  @override
  set passController(TextEditingController value) {
    _$passControllerAtom.reportWrite(value, super.passController, () {
      super.passController = value;
    });
  }

  late final _$confirmControllerAtom = Atom(
      name: '_RegisterScreenViewModelBase.confirmController', context: context);

  @override
  TextEditingController get confirmController {
    _$confirmControllerAtom.reportRead();
    return super.confirmController;
  }

  @override
  set confirmController(TextEditingController value) {
    _$confirmControllerAtom.reportWrite(value, super.confirmController, () {
      super.confirmController = value;
    });
  }

  late final _$emailTextAtom =
      Atom(name: '_RegisterScreenViewModelBase.emailText', context: context);

  @override
  String get emailText {
    _$emailTextAtom.reportRead();
    return super.emailText;
  }

  @override
  set emailText(String value) {
    _$emailTextAtom.reportWrite(value, super.emailText, () {
      super.emailText = value;
    });
  }

  late final _$passTextAtom =
      Atom(name: '_RegisterScreenViewModelBase.passText', context: context);

  @override
  String get passText {
    _$passTextAtom.reportRead();
    return super.passText;
  }

  @override
  set passText(String value) {
    _$passTextAtom.reportWrite(value, super.passText, () {
      super.passText = value;
    });
  }

  late final _$confirmTextAtom =
      Atom(name: '_RegisterScreenViewModelBase.confirmText', context: context);

  @override
  String get confirmText {
    _$confirmTextAtom.reportRead();
    return super.confirmText;
  }

  @override
  set confirmText(String value) {
    _$confirmTextAtom.reportWrite(value, super.confirmText, () {
      super.confirmText = value;
    });
  }

  late final _$_RegisterScreenViewModelBaseActionController =
      ActionController(name: '_RegisterScreenViewModelBase', context: context);

  @override
  void changeEmailText(String value) {
    final _$actionInfo = _$_RegisterScreenViewModelBaseActionController
        .startAction(name: '_RegisterScreenViewModelBase.changeEmailText');
    try {
      return super.changeEmailText(value);
    } finally {
      _$_RegisterScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassText(String value) {
    final _$actionInfo = _$_RegisterScreenViewModelBaseActionController
        .startAction(name: '_RegisterScreenViewModelBase.changePassText');
    try {
      return super.changePassText(value);
    } finally {
      _$_RegisterScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmText(String value) {
    final _$actionInfo = _$_RegisterScreenViewModelBaseActionController
        .startAction(name: '_RegisterScreenViewModelBase.changeConfirmText');
    try {
      return super.changeConfirmText(value);
    } finally {
      _$_RegisterScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authManager: ${authManager},
emailController: ${emailController},
passController: ${passController},
confirmController: ${confirmController},
emailText: ${emailText},
passText: ${passText},
confirmText: ${confirmText}
    ''';
  }
}
