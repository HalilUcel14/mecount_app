// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenViewModel on _LoginScreenViewModelBase, Store {
  late final _$emailControllerAtom =
      Atom(name: '_LoginScreenViewModelBase.emailController', context: context);

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

  late final _$passControllerAtom =
      Atom(name: '_LoginScreenViewModelBase.passController', context: context);

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

  late final _$emailTextAtom =
      Atom(name: '_LoginScreenViewModelBase.emailText', context: context);

  @override
  String? get emailText {
    _$emailTextAtom.reportRead();
    return super.emailText;
  }

  @override
  set emailText(String? value) {
    _$emailTextAtom.reportWrite(value, super.emailText, () {
      super.emailText = value;
    });
  }

  late final _$passTextAtom =
      Atom(name: '_LoginScreenViewModelBase.passText', context: context);

  @override
  String? get passText {
    _$passTextAtom.reportRead();
    return super.passText;
  }

  @override
  set passText(String? value) {
    _$passTextAtom.reportWrite(value, super.passText, () {
      super.passText = value;
    });
  }

  late final _$_LoginScreenViewModelBaseActionController =
      ActionController(name: '_LoginScreenViewModelBase', context: context);

  @override
  void changeEmailText(String? value) {
    final _$actionInfo = _$_LoginScreenViewModelBaseActionController
        .startAction(name: '_LoginScreenViewModelBase.changeEmailText');
    try {
      return super.changeEmailText(value);
    } finally {
      _$_LoginScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassText(String? value) {
    final _$actionInfo = _$_LoginScreenViewModelBaseActionController
        .startAction(name: '_LoginScreenViewModelBase.changePassText');
    try {
      return super.changePassText(value);
    } finally {
      _$_LoginScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailController: ${emailController},
passController: ${passController},
emailText: ${emailText},
passText: ${passText}
    ''';
  }
}
