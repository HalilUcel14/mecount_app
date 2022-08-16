// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotScreenViewModel on _ForgotScreenViewModelBase, Store {
  late final _$emailControllerAtom = Atom(
      name: '_ForgotScreenViewModelBase.emailController', context: context);

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

  late final _$emailTextAtom =
      Atom(name: '_ForgotScreenViewModelBase.emailText', context: context);

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

  late final _$_ForgotScreenViewModelBaseActionController =
      ActionController(name: '_ForgotScreenViewModelBase', context: context);

  @override
  void changeEmailText(String value) {
    final _$actionInfo = _$_ForgotScreenViewModelBaseActionController
        .startAction(name: '_ForgotScreenViewModelBase.changeEmailText');
    try {
      return super.changeEmailText(value);
    } finally {
      _$_ForgotScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailController: ${emailController},
emailText: ${emailText}
    ''';
  }
}
