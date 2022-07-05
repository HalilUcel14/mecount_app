import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../viewmodel/onboard_viewmodel.dart';

class OnBoardScreen extends BaseStateless {
  OnBoardScreen({Key? key}) : super(key: key);
  //
  late final OnBoardScreenViewModel _viewModel;
  late final BuildContext _context;
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardScreenViewModel>(
      viewModel: OnBoardScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardScreenViewModel viewModel) {
        _viewModel = viewModel;
        _context = context;
        return _scaffold();
      },
    );
  }

  Scaffold _scaffold() => const Scaffold();
}
