// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VerifyScreenViewModel on _VerifyScreenViewModelBase, Store {
  late final _$buttonClickedAtom =
      Atom(name: '_VerifyScreenViewModelBase.buttonClicked', context: context);

  @override
  bool get buttonClicked {
    _$buttonClickedAtom.reportRead();
    return super.buttonClicked;
  }

  @override
  set buttonClicked(bool value) {
    _$buttonClickedAtom.reportWrite(value, super.buttonClicked, () {
      super.buttonClicked = value;
    });
  }

  late final _$timerAtom =
      Atom(name: '_VerifyScreenViewModelBase.timer', context: context);

  @override
  int get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(int value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  late final _$emailControllerAtom = Atom(
      name: '_VerifyScreenViewModelBase.emailController', context: context);

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
      Atom(name: '_VerifyScreenViewModelBase.emailText', context: context);

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

  late final _$isSuccessAtom =
      Atom(name: '_VerifyScreenViewModelBase.isSuccess', context: context);

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  late final _$isEmailVerifiedAtom = Atom(
      name: '_VerifyScreenViewModelBase.isEmailVerified', context: context);

  @override
  bool get isEmailVerified {
    _$isEmailVerifiedAtom.reportRead();
    return super.isEmailVerified;
  }

  @override
  set isEmailVerified(bool value) {
    _$isEmailVerifiedAtom.reportWrite(value, super.isEmailVerified, () {
      super.isEmailVerified = value;
    });
  }

  late final _$buttonTimerAtom =
      Atom(name: '_VerifyScreenViewModelBase.buttonTimer', context: context);

  @override
  Timer? get buttonTimer {
    _$buttonTimerAtom.reportRead();
    return super.buttonTimer;
  }

  @override
  set buttonTimer(Timer? value) {
    _$buttonTimerAtom.reportWrite(value, super.buttonTimer, () {
      super.buttonTimer = value;
    });
  }

  late final _$sendEmailValidAsyncAction = AsyncAction(
      '_VerifyScreenViewModelBase.sendEmailValid',
      context: context);

  @override
  Future<dynamic> sendEmailValid() {
    return _$sendEmailValidAsyncAction.run(() => super.sendEmailValid());
  }

  late final _$checkEmailVerifiedAsyncAction = AsyncAction(
      '_VerifyScreenViewModelBase.checkEmailVerified',
      context: context);

  @override
  Future<dynamic> checkEmailVerified() {
    return _$checkEmailVerifiedAsyncAction
        .run(() => super.checkEmailVerified());
  }

  late final _$_VerifyScreenViewModelBaseActionController =
      ActionController(name: '_VerifyScreenViewModelBase', context: context);

  @override
  void startButtonTimer() {
    final _$actionInfo = _$_VerifyScreenViewModelBaseActionController
        .startAction(name: '_VerifyScreenViewModelBase.startButtonTimer');
    try {
      return super.startButtonTimer();
    } finally {
      _$_VerifyScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEmailVerified() {
    final _$actionInfo = _$_VerifyScreenViewModelBaseActionController
        .startAction(name: '_VerifyScreenViewModelBase.changeEmailVerified');
    try {
      return super.changeEmailVerified();
    } finally {
      _$_VerifyScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEmailText(String value) {
    final _$actionInfo = _$_VerifyScreenViewModelBaseActionController
        .startAction(name: '_VerifyScreenViewModelBase.changeEmailText');
    try {
      return super.changeEmailText(value);
    } finally {
      _$_VerifyScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSuccess() {
    final _$actionInfo = _$_VerifyScreenViewModelBaseActionController
        .startAction(name: '_VerifyScreenViewModelBase.changeSuccess');
    try {
      return super.changeSuccess();
    } finally {
      _$_VerifyScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeButtonText(int value) {
    final _$actionInfo = _$_VerifyScreenViewModelBaseActionController
        .startAction(name: '_VerifyScreenViewModelBase.changeButtonText');
    try {
      return super.changeButtonText(value);
    } finally {
      _$_VerifyScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void buttonTimerChange(int value) {
    final _$actionInfo = _$_VerifyScreenViewModelBaseActionController
        .startAction(name: '_VerifyScreenViewModelBase.buttonTimerChange');
    try {
      return super.buttonTimerChange(value);
    } finally {
      _$_VerifyScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pressButton() {
    final _$actionInfo = _$_VerifyScreenViewModelBaseActionController
        .startAction(name: '_VerifyScreenViewModelBase.pressButton');
    try {
      return super.pressButton();
    } finally {
      _$_VerifyScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonClicked: ${buttonClicked},
timer: ${timer},
emailController: ${emailController},
emailText: ${emailText},
isSuccess: ${isSuccess},
isEmailVerified: ${isEmailVerified},
buttonTimer: ${buttonTimer}
    ''';
  }
}
