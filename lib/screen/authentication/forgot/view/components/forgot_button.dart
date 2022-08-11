import 'package:account_app/core/widget/auth/if_have_an_account.dart';
import 'package:account_app/screen/authentication/forgot/view_model/forgot_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widget/auth/sign_elevated_button.dart';

class ForgotButton extends StatelessWidget {
  const ForgotButton({Key? key, required this.viewModel}) : super(key: key);
  //
  final ForgotScreenViewModel viewModel;
  //
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SignElevatedButton(
              buttonText: 'Send Email',
              fontSize: 16,
              size: const Size(120, 30),
              button: viewModel.pressButton,
            ),
            const Spacer(),
            IfHaveAnAccountButton(
              accountText: viewModel.constants.dontHaveAccount,
              fontSize: constraints.maxHeight * 0.075,
              nextPageButtonText: viewModel.constants.signUp,
              pathToPage: AppRoutes.register,
            ),
          ],
        );
      },
    );
  }
}
