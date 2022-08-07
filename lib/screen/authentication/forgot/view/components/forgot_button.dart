import 'package:account_app/screen/authentication/forgot/view_model/forgot_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/auth/sign_elevated_button.dart';

class ForgotButton extends StatelessWidget {
  const ForgotButton({Key? key, required this.viewModel}) : super(key: key);
  //
  final ForgotScreenViewModel viewModel;
  //
  @override
  Widget build(BuildContext context) {
    return SignElevatedButton(
      buttonText: 'Send Email',
      fontSize: 16,
      size: const Size(120, 30),
      button: viewModel.pressButton,
    );
  }
}
