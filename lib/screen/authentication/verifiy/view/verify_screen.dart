// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../core/enum/asset_enum.dart';
import '../../../../core/widget/animate_lottie_builder.dart';
import '../../../../core/widget/default_container_screen_widget.dart';
import '../view_model/verify_viewmodel.dart';
import 'components/verify_buttons.dart';
import 'components/verify_logo_and_title.dart';

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

  Scaffold _scaffold() => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Observer(builder: (context) {
            return DefaultContainerCreateScreen(
              child: _viewModel.isSuccess
                  ? AnimatedLottieBuilder(
                      iconPath: AssetLottieEnum.otpVerify.path,
                    )
                  : _column(),
            );
          }),
        ),
      );

  Column _column() {
    return Column(
      children: [
        Expanded(child: VerifyLogoAndTitle(viewModel: _viewModel), flex: 2),
        Expanded(child: VerifyButtons(viewModel: _viewModel), flex: 2),
      ],
    );
  }
}
