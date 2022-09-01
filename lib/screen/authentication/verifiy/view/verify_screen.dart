// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../view_model/verify_viewmodel.dart';

class VerifyScreen extends BaseStateless {
  VerifyScreen({Key? key}) : super(key: key);
  //
  late VerifyScreenViewModel _viewModel;
  late BuildContext _context;
  //
  @override
  Widget build(BuildContext context) {
    return BaseView<VerifyScreenViewModel>(
      viewModel: VerifyScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, VerifyScreenViewModel viewModel) {
        _viewModel = viewModel;
        _context = context;
        return _scaffold();
      },
    );
  }

  Scaffold _scaffold() => const Scaffold();
}
