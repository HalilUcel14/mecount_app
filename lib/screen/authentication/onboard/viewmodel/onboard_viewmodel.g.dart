// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnBoardScreenViewModel on _OnBoardScreenViewModelBase, Store {
  late final _$controllerAtom =
      Atom(name: '_OnBoardScreenViewModelBase.controller', context: context);

  @override
  PageController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(PageController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$onboardListAtom =
      Atom(name: '_OnBoardScreenViewModelBase.onboardList', context: context);

  @override
  List<OnBoardModel> get onboardList {
    _$onboardListAtom.reportRead();
    return super.onboardList;
  }

  @override
  set onboardList(List<OnBoardModel> value) {
    _$onboardListAtom.reportWrite(value, super.onboardList, () {
      super.onboardList = value;
    });
  }

  @override
  String toString() {
    return '''
controller: ${controller},
onboardList: ${onboardList}
    ''';
  }
}
