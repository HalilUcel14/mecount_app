import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../core/enum/asset_enum.dart';
import '../../../../core/widget/animate_lottie_builder.dart';
import '../../../../core/widget/default_container_screen_widget.dart';
import '../view_model/forgot_viewmodel.dart';
import 'components/forgot_button.dart';
import 'components/forgot_form_field.dart';
import 'components/forgot_image.dart';
import 'components/forgot_title.dart';

// ignore: must_be_immutable
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
        _viewModel.emailController.dispose();
        _viewModel.emailFocus.dispose();
      },
    );
  }

  Widget _scaffold() {
    return Observer(builder: (context) {
      return DefaultContainerCreateScreen(
        height: _context.height * 0.8,
        decoration: _forgotContainerDecoration(),
        child: _viewModel.isSuccess
            ? AnimatedLottieBuilder(iconPath: AssetLottieEnum.succesfull.path)
            : _column(),
      );
    });
  }

  Column _column() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _context.isKeyboardOpen
            ? const SizedBox()
            : const Expanded(child: ForgotLottieImage()),
        Expanded(child: _forgotTitleAndForm()),
        Expanded(child: ForgotButton(viewModel: _viewModel)),
      ],
    );
  }

  BoxDecoration _forgotContainerDecoration() {
    return BoxDecoration(
      color: _context.theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_context.height * 0.05),
        topRight: Radius.circular(_context.height * 0.05),
      ),
    );
  }

  Column _forgotTitleAndForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ForgotTitleSubTitle(viewModel: _viewModel),
        ForgotFormField(viewModel: _viewModel),
      ],
    );
  }
}
