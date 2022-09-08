import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../core/enum/asset_enum.dart';
import '../../../../core/widget/animate_lottie_builder.dart';
import '../view_model/forgot_viewmodel.dart';
import 'components/forgot_button.dart';
import 'components/forgot_form_field.dart';
import 'components/forgot_image.dart';
import 'components/forgot_title.dart';

// ignore: must_be_immutable
class ForgotScreen extends BaseStateless {
  ForgotScreen({Key? key, this.baseEmailAddress}) : super(key: key);
  //
  late ForgotScreenViewModel _viewModel;
  late BuildContext _context;
  final String? baseEmailAddress;
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
      double containerMaxHeight = _context.height * 0.8;
      return Container(
        padding: context.padAllN,
        height: containerMaxHeight,
        decoration: _forgotContainerDecoration(),
        child: _viewModel.isSuccess
            ? _lottieColumn()
            : _column(containerMaxHeight),
      );
    });
  }

  Widget _lottieColumn() {
    return Container(
      child: AnimatedLottieAssetBuilder(
        iconPath: AssetLottieEnum.succesfull.path,
      ),
    );
  }

  Column _column(double containerMaxHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _context.isKeyboardOpen
            ? const SizedBox.shrink()
            : Expanded(
                child:
                    ForgotLottieImage(maxContainerHeight: containerMaxHeight)),
        Expanded(child: _forgotTitleAndForm(containerMaxHeight)),
        Expanded(
            child: ForgotButton(
                viewModel: _viewModel, maxContainerHeight: containerMaxHeight)),
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

  Column _forgotTitleAndForm(double containerMaxHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ForgotTitleSubTitle(viewModel: _viewModel),
        ForgotFormField(
          viewModel: _viewModel,
          baseEmailAddress: baseEmailAddress,
          maxContainerHeight: containerMaxHeight,
        ),
      ],
    );
  }
}
