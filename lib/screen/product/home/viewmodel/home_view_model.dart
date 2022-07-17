import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/i_firebase_auth_manager.dart';

part 'home_view_model.g.dart';

class HomeScreenViewModel = _HomeScreenViewModelBase with _$HomeScreenViewModel;

abstract class _HomeScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}

  @observable
  FirebaseAuthManager authManager = FirebaseAuthManager.instance;
}
