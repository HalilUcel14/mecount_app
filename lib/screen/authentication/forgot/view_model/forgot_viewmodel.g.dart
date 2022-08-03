// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotScreenViewModel on _ForgotScreenViewModelBase, Store {
  late final _$emailcontrollerAtom = Atom(
      name: '_ForgotScreenViewModelBase.emailcontroller', context: context);

  @override
  TextEditingController get emailcontroller {
    _$emailcontrollerAtom.reportRead();
    return super.emailcontroller;
  }

  @override
  set emailcontroller(TextEditingController value) {
    _$emailcontrollerAtom.reportWrite(value, super.emailcontroller, () {
      super.emailcontroller = value;
    });
  }

  late final _$emailTextAtom =
      Atom(name: '_ForgotScreenViewModelBase.emailText', context: context);

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
      Atom(name: '_ForgotScreenViewModelBase.passText', context: context);

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

  late final _$_ForgotScreenViewModelBaseActionController =
      ActionController(name: '_ForgotScreenViewModelBase', context: context);

  @override
  void changeEmailText(String? value) {
    final _$actionInfo = _$_ForgotScreenViewModelBaseActionController
        .startAction(name: '_ForgotScreenViewModelBase.changeEmailText');
    try {
      return super.changeEmailText(value);
    } finally {
      _$_ForgotScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassText(String? value) {
    final _$actionInfo = _$_ForgotScreenViewModelBaseActionController
        .startAction(name: '_ForgotScreenViewModelBase.changePassText');
    try {
      return super.changePassText(value);
    } finally {
      _$_ForgotScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailcontroller: ${emailcontroller},
emailText: ${emailText},
passText: ${passText}
    ''';
  }
}
