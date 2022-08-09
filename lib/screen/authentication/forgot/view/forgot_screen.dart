import 'components/forgot_button.dart';
import 'components/forgot_form_field.dart';
import 'components/forgot_image.dart';
import 'components/forgot_title.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../view_model/forgot_viewmodel.dart';

class ForgotScreen extends BaseStateless {
  ForgotScreen({Key? key}) : super(key: key);
  //
  late ForgotScreenViewModel _viewModel;
  late BuildContext _context;
  //
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
      onDispose: () {
        //  _viewModel.emailController.dispose();
        //  _viewModel.emailFocus.dispose();
      },
    );
  }

  Widget _scaffold() {
    return Container(
      height: _context.height * 0.8,
      color: _context.theme.scaffoldBackgroundColor,
      constraints: BoxConstraints(
        maxWidth: ResponsivityConstants.instance.mediumScreenSize.toDouble(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: ForgotLottieImage()),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const ForgotTitleSubTitle(),
                ForgotFormField(viewModel: _viewModel),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [ForgotButton(viewModel: _viewModel)],
            ),
          ),
        ],
      ),
    );
  }
}
