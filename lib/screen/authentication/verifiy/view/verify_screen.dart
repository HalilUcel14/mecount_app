// ignore_for_file: must_be_immutable, unused_field

import 'package:account_app/core/enum/asset_enum.dart';
import 'package:account_app/core/widget/animate_lottie_builder.dart';
import 'package:account_app/screen/authentication/verifiy/view/components/verify_buttons.dart';
import 'package:account_app/screen/authentication/verifiy/view/components/verify_text_message.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../core/widget/default_container_screen_widget.dart';
import '../view_model/verify_viewmodel.dart';

class VerifyScreen extends BaseStateless {
  VerifyScreen({Key? key}) : super(key: key);
  late VerifyScreenViewModel _viewModel;
  late BuildContext _context;
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
      onDispose: () {
        _viewModel.buttonTimer?.cancel();
      },
    );
  }

  Scaffold _scaffold() => Scaffold(
        body: DefaultContainerCreateScreen(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: AnimatedLottieAssetBuilder(
                      iconPath: AssetLottieEnum.emailSend.path),
                  flex: 2,
                ),
                Expanded(
                  child: VerifyTextColumn(viewModel: _viewModel),
                  flex: 2,
                ),
                Expanded(child: VerifyButtons(viewModel: _viewModel)),
              ],
            ),
          ),
        ),
      );
}
