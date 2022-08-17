// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widget/auth/divider_text.dart';
import '../../../../../core/widget/auth/if_have_an_account.dart';
import '../../../../../core/widget/auth/sign_elevated_button.dart';
import '../../../../../core/widget/auth/social_sign_buttons.dart';
import '../../view_model/register_viewmodel.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({Key? key, required this.viewModel}) : super(key: key);

  final RegisterScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            _signButton(constraints, context),
            const Spacer(flex: 3),
            _dividerOrSign(constraints, context),
            const Spacer(),
            _socialButton(constraints, context),
            const Spacer(flex: 3),
            _alreadyHaveAccount(constraints, context),
          ],
        );
      },
    );
  }

  Widget _signButton(BoxConstraints constraints, BuildContext context) {
    return SignElevatedButton(
      buttonText: viewModel.constants.signUp,
      fontSize: constraints.maxHeight * 0.075,
      size: Size(constraints.maxWidth * 0.32, constraints.maxHeight * 0.16),
      button: viewModel.registerPressed,
    );
  }

  Widget _socialButton(BoxConstraints constraints, BuildContext context) {
    return SocialSignButtons(
      size: constraints.maxHeight * 0.16,
      facebook: () => viewModel.authManager.signInWithFacebook(),
      google: () => viewModel.authManager.signInWithGoogle(),
      twitter: () => viewModel.authManager.signInWithTwitter(),
    );
  }

  Widget _dividerOrSign(BoxConstraints constraints, BuildContext context) {
    return DividerWithText(
      dividerText: viewModel.constants.dividerText,
      fontSize: constraints.maxHeight * 0.07,
    );
  }

  Widget _alreadyHaveAccount(BoxConstraints constraints, BuildContext context) {
    return IfHaveAnAccountButton(
      accountText: viewModel.constants.haveAccount,
      fontSize: constraints.maxHeight * 0.06,
      nextPageButtonText: viewModel.constants.signIn,
      pathToPage: AppRoutes.login,
    );
  }
}
