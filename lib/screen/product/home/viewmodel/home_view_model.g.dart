// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenViewModel on _HomeScreenViewModelBase, Store {
  late final _$isOpenBottomSheetAtom = Atom(
      name: '_HomeScreenViewModelBase.isOpenBottomSheet', context: context);

  @override
  bool get isOpenBottomSheet {
    _$isOpenBottomSheetAtom.reportRead();
    return super.isOpenBottomSheet;
  }

  @override
  set isOpenBottomSheet(bool value) {
    _$isOpenBottomSheetAtom.reportWrite(value, super.isOpenBottomSheet, () {
      super.isOpenBottomSheet = value;
    });
  }

  late final _$isLightModeAtom =
      Atom(name: '_HomeScreenViewModelBase.isLightMode', context: context);

  @override
  bool get isLightMode {
    _$isLightModeAtom.reportRead();
    return super.isLightMode;
  }

  @override
  set isLightMode(bool value) {
    _$isLightModeAtom.reportWrite(value, super.isLightMode, () {
      super.isLightMode = value;
    });
  }

  late final _$_HomeScreenViewModelBaseActionController =
      ActionController(name: '_HomeScreenViewModelBase', context: context);

  @override
  void changeThemeMode() {
    final _$actionInfo = _$_HomeScreenViewModelBaseActionController.startAction(
        name: '_HomeScreenViewModelBase.changeThemeMode');
    try {
      return super.changeThemeMode();
    } finally {
      _$_HomeScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeOpenBottomSheet() {
    final _$actionInfo = _$_HomeScreenViewModelBaseActionController.startAction(
        name: '_HomeScreenViewModelBase.changeOpenBottomSheet');
    try {
      return super.changeOpenBottomSheet();
    } finally {
      _$_HomeScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isOpenBottomSheet: ${isOpenBottomSheet},
isLightMode: ${isLightMode}
    ''';
  }
}
