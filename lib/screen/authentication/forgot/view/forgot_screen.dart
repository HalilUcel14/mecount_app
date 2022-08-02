import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../view_model/forgot_viewmodel.dart';

class ForgotScreen extends BaseStateless {
  ForgotScreen({Key? key}) : super(key: key);
  late ForgotScreenViewModel _viewModel;
  late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotScreenViewModel>(
      viewModel: ForgotScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ForgotScreenViewModel viewModel) {
        _viewModel = viewModel;
        _context = context;
        return _scaffold();
      },
    );
  }

  Scaffold _scaffold() => Scaffold(
        body: BottomSheet(
          onClosing: () {},
          builder: (_) {
            return Container();
          },
        ),
      );
}
