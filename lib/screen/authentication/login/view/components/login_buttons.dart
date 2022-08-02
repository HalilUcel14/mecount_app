import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widget/Icon_logo.dart';

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
            _dividerOrSign(constraints),
            // Social Button Login
            const Spacer(flex: 1),
            _socialButton(constraints),
            const Spacer(flex: 6),
            // Dont Have Account
            _dontHaveAccount(constraints, context),
            const Spacer(),
          ],
        );
      },
    );
  }

  Row _dontHaveAccount(BoxConstraints constraints, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          viewModel.constants.dontHaveAccount,
          style: TextStyle(fontSize: constraints.maxHeight * 0.05),
        ),
        TextButton(
          onPressed: () async {
            await context.pushNameAndRemoveUntil(AppRoutes.register);
          },
          child: Text(
            viewModel.constants.signUp,
            style: TextStyle(fontSize: constraints.maxHeight * 0.055),
          ),
        ),
      ],
    );
  }

  Row _socialButton(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            viewModel.themeManager.changeTheme(ThemeEnum.DARK);
          },
          child: IconsLogo(
            size: constraints.maxHeight * 0.16,
            logoIconName: viewModel.constants.facebookIcon,
          ),
        ),
        IconsLogo(
          size: constraints.maxHeight * 0.16,
          logoIconName: viewModel.constants.googleIcon,
        ),
        IconsLogo(
          size: constraints.maxHeight * 0.16,
          logoIconName: viewModel.constants.twitterIcon,
        ),
      ],
    );
  }

  Row _dividerOrSign(BoxConstraints constraints) {
    return Row(
      children: [
        _divider(),
        Text(
          viewModel.constants.dividerText,
          style: TextStyle(
            fontSize: constraints.maxHeight * 0.05,
          ),
        ),
        _divider(),
      ],
    );
  }

  ElevatedButtonWithStadiumBorder _signinButton(
      BoxConstraints constraints, BuildContext context) {
    return ElevatedButtonWithStadiumBorder(
      child: Text(
        viewModel.constants.signIn,
        style: TextStyle(
          fontSize: constraints.maxHeight * 0.05,
        ),
      ),
      onPressed: viewModel.buttonPressed,
      fixedSize: Size(
        constraints.maxWidth * 0.3,
        constraints.maxHeight * 0.13,
      ),
    );
  }

  Expanded _divider() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: const Divider(
          color: Colors.black,
          thickness: 1,
        ),
      ),
    );
  }
}
