import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widget/auth/if_have_an_account.dart';
import '../../../../../core/widget/auth/sign_elevated_button.dart';
import '../../view_model/forgot_viewmodel.dart';

class ForgotButton extends StatelessWidget {
  const ForgotButton(
      {Key? key, required this.viewModel, this.maxContainerHeight})
      : super(key: key);
  //
  final ForgotScreenViewModel viewModel;
  final double? maxContainerHeight;
  //
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SignElevatedButton(
              buttonText: viewModel.constants.sendEmail,
              fontSize: constraints.maxHeight * 0.1,
              size: _defaultSizeWithMax(maxContainerHeight!),
              button: viewModel.pressButton,
            ),
            IfHaveAnAccountButton(
              accountText: viewModel.constants.dontHaveAccount,
              fontSize: maxContainerHeight! * 0.025,
              nextPageButtonText: viewModel.constants.signUp,
              pathToPage: AppRoutes.register,
            ),
          ],
        );
      },
    );
  }

  Size _defaultSizeWithMax(double max) {
    return Size(max * 0.25, max * 0.06);
  }
}
