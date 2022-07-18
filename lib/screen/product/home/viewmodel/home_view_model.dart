import 'package:account_app/core/theme/theme_manager.dart';
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
}
