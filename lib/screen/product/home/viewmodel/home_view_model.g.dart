// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenViewModel on _HomeScreenViewModelBase, Store {
  late final _$authManagerAtom =
      Atom(name: '_HomeScreenViewModelBase.authManager', context: context);

  @override
  FirebaseAuthManager get authManager {
    _$authManagerAtom.reportRead();
    return super.authManager;
  }

  @override
  set authManager(FirebaseAuthManager value) {
    _$authManagerAtom.reportWrite(value, super.authManager, () {
      super.authManager = value;
    });
  }

  @override
  String toString() {
    return '''
authManager: ${authManager}
    ''';
  }
}
