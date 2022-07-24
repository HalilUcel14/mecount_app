import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/firebase/i_firebase_auth_manager.dart';
import '../../../../core/firebase/i_firebase_cloud_firestore_manager.dart';
import '../../../../core/theme/theme_manager.dart';
import '../../../../product/model/company_model.dart';

part 'home_view_model.g.dart';

class HomeScreenViewModel = _HomeScreenViewModelBase with _$HomeScreenViewModel;

abstract class _HomeScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}

  FirebaseCloudFirestoreManager cloudFirestoreManager =
      FirebaseCloudFirestoreManager.instance;
  FirebaseAuthManager authManager = FirebaseAuthManager.instance;
  ThemeManager themeManager = ThemeManager.instance;

  @observable
  bool isOpenBottomSheet = false;

  @observable
  bool isLightMode = true;

  @action
  void changeThemeMode() {
    isLightMode = !isLightMode;
    isLightMode
        ? themeManager.changeTheme(ThemeEnum.DARK)
        : themeManager.changeTheme(ThemeEnum.LIGHT);
  }

  @action
  void changeOpenBottomSheet() {
    isOpenBottomSheet = !isOpenBottomSheet;
  }

  //get user current Company
  Future<CompanyModel>? company() {
    return null;
  }
  //
}
