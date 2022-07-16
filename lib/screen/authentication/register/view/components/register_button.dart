import 'package:account_app/screen/authentication/register/view_model/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hucel_widget/hucel_widget.dart';
import 'package:hucel_core/hucel_core.dart';
import '../../../../../core/routes/app_routes.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({Key? key, required this.viewModel}) : super(key: key);

  final RegisterScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return Column(
          children: [
            ElevatedButtonWithStadiumBorder(
              child: Text(
                viewModel.constant.registerButton,
                style: TextStyle(fontSize: height * 0.075),
              ),
              fixedSize: Size(width * 0.3, height * 0.13),
              onPressed: registerPressed,
            ),
            const Spacer(flex: 5),
            _alreadyHaveAccount(constraints, context),
            const Spacer(),
          ],
        );
      },
    );
  }

  Row _alreadyHaveAccount(BoxConstraints constraints, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          viewModel.constant.haveAccount,
          style: TextStyle(fontSize: constraints.maxHeight * 0.075),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.login, (route) => false);
          },
          child: Text(
            viewModel.constant.logInTextButton,
            style: TextStyle(fontSize: constraints.maxHeight * 0.08),
          ),
        )
      ],
    );
  }

  void registerPressed() {
    viewModel.formKey.currentState!.save();

    if (viewModel.isNotEmpty()) {
      if (viewModel.isMatchPass()) {
        if (!viewModel.emailText.isValidEmail) {
          print('Not Valid your Email');
        }
        if (!viewModel.passText.isValidLowPassword) {
          print('Not Valid Your Password');
        }
      } else {
        print('İs Not Match Confirm and Password');
      }
    } else {
      print('Your TextField is Empty');
    }
  }
}
