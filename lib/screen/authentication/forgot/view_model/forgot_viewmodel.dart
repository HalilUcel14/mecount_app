import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

part 'forgot_viewmodel.g.dart';

class ForgotScreenViewModel = _ForgotScreenViewModelBase
    with _$ForgotScreenViewModel;

abstract class _ForgotScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}
}
