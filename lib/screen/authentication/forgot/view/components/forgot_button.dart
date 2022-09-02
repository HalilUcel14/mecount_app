import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widget/auth/if_have_an_account.dart';
import '../../../../../core/widget/auth/sign_elevated_button.dart';
import '../../view_model/forgot_viewmodel.dart';

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
              buttonText: viewModel.constants.sendEmail,
              fontSize: constraints.maxHeight * 0.08,
              size: Size(
                constraints.maxHeight * 0.6,
                constraints.maxHeight * 0.2,
              ),
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
