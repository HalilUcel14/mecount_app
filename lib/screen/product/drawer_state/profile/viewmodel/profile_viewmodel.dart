import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import '../../../../../core/firebase/i_firebase_auth_manager.dart';
part 'profile_viewmodel.g.dart';

class ProfileScreenViewModel = _ProfileScreenViewModelBase
    with _$ProfileScreenViewModel;

abstract class _ProfileScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}

  FirebaseAuthManager authManager = FirebaseAuthManager.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final formKey = GlobalKey<FormState>();

  @observable
  TextEditingController companyNameController = TextEditingController();
}
