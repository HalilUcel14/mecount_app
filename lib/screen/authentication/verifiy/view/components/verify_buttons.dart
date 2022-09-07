import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../core/widget/auth/sign_elevated_button.dart';
import '../../view_model/verify_viewmodel.dart';

class VerifyButtons extends StatelessWidget {
  const VerifyButtons({Key? key, required this.viewModel}) : super(key: key);

  final VerifyScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SignElevatedButton(
        buttonText: viewModel.buttonClicked
            ? 'Please Wait ${viewModel.timer}'
            : viewModel.constants.resendEmail,
        fontSize: context.height * 0.025,
        button: viewModel.pressButton,
        size: Size(
          context.height * 0.25,
          context.height * 0.06,
        ),
      );
    });
  }
}
