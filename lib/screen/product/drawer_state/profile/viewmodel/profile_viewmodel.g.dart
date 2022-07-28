// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileScreenViewModel on _ProfileScreenViewModelBase, Store {
  late final _$companyNameControllerAtom = Atom(
      name: '_ProfileScreenViewModelBase.companyNameController',
      context: context);

  @override
  TextEditingController get companyNameController {
    _$companyNameControllerAtom.reportRead();
    return super.companyNameController;
  }

  @override
  set companyNameController(TextEditingController value) {
    _$companyNameControllerAtom.reportWrite(value, super.companyNameController,
        () {
      super.companyNameController = value;
    });
  }

  @override
  String toString() {
    return '''
companyNameController: ${companyNameController}
    ''';
  }
}
