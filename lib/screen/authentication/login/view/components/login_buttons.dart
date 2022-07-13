import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widget/Icon_logo.dart';
import '../../viewmodel/login_view_model.dart';
import '../login_constant.dart';

class LoginFormButtons extends StatelessWidget {
  LoginFormButtons({Key? key, required this.viewModel}) : super(key: key);
  //
  final LoginScreenViewModel viewModel;
  final LoginConstant _loginConstant = LoginConstant.instance;
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
            _dontHaveAccount(constraints),
            const Spacer(),
          ],
        );
      },
    );
  }

  Row _dontHaveAccount(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _loginConstant.dontHaveAccount,
          style: TextStyle(fontSize: constraints.maxHeight * 0.05),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              _loginConstant.signUp,
              style: TextStyle(fontSize: constraints.maxHeight * 0.05),
            ))
      ],
    );
  }

  Row _socialButton(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconsLogo(
          size: constraints.maxHeight * 0.16,
          logoIconName: _loginConstant.facebookIcon,
        ),
        IconsLogo(
          size: constraints.maxHeight * 0.16,
          logoIconName: _loginConstant.googleIcon,
        ),
        IconsLogo(
          size: constraints.maxHeight * 0.16,
          logoIconName: _loginConstant.twitterIcon,
        ),
      ],
    );
  }

  Row _dividerOrSign(BoxConstraints constraints) {
    return Row(
      children: [
        _divider(),
        Text(
          _loginConstant.orSignWith,
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
        _loginConstant.signInButton,
        style: TextStyle(
          fontSize: constraints.maxHeight * 0.05,
        ),
      ),
      onPressed: () {
        FirebaseEmailPassAuthHelper()
            .signIn(context,
                email: viewModel.emailText!, password: viewModel.passText!)
            .then((value) {
          print(value);
        });
        context.navigateName(AppRoutes.home);
      },
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
    ));
  }
}
