import 'package:account_app/core/widget/auth/divider_text.dart';
import 'package:account_app/core/widget/auth/sign_elevated_button.dart';
import 'package:account_app/core/widget/auth/social_sign_buttons.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';

import '../../../../../core/widget/auth/if_have_an_account.dart';
import '../../viewmodel/login_view_model.dart';

class LoginFormButtons extends StatelessWidget {
  const LoginFormButtons({Key? key, required this.viewModel}) : super(key: key);
  //
  final LoginScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            const Spacer(flex: 2),
            _signinButton(constraints, context),
            // ------ Or ----- Bölümü
            const Spacer(flex: 5),
            _dividerOrSign(constraints, context),
            // Social Button Login
            const Spacer(flex: 1),
            _socialButton(constraints, context),
            const Spacer(flex: 6),
            // Dont Have Account
            _dontHaveAccount(constraints, context),
          ],
        );
      },
    );
  }

  Widget _dontHaveAccount(BoxConstraints constraints, BuildContext context) {
    return IfHaveAnAccountButton(
      accountText: viewModel.constants.dontHaveAccount,
      fontSize: constraints.maxHeight * 0.050,
      nextPageButtonText: viewModel.constants.signUp,
      pathToPage: AppRoutes.register,
    );
  }

  Widget _socialButton(BoxConstraints constraints, BuildContext context) {
    return SocialSignButtons(
      key: GlobalKey(),
      manager: viewModel.authManager,
      size: constraints.maxHeight * 0.16,
    );
  }

  Widget _dividerOrSign(BoxConstraints constraints, BuildContext context) {
    return DividerWithText(
      dividerText: viewModel.constants.dividerText,
      fontSize: constraints.maxHeight * 0.05,
    );
  }

  Widget _signinButton(BoxConstraints constraints, BuildContext context) {
    return SignElevatedButton(
      buttonText: viewModel.constants.signIn,
      fontSize: constraints.maxHeight * 0.05,
      size: Size(
        constraints.maxWidth * 0.3,
        constraints.maxHeight * 0.13,
      ),
      button: viewModel.buttonPressed,
    );
  }
}
