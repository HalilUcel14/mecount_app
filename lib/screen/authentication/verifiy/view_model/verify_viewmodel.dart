import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';
part 'verify_viewmodel.g.dart';

class VerifyScreenViewModel = _VerifyScreenViewModelBase
    with _$VerifyViewMocdel;

abstract class _VerifyScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}
}
