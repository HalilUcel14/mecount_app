import 'package:account_app/screen/authentication/verifiy/view_model/verify_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/widget/auth/sign_elevated_button.dart';

class VerifyButtons extends StatelessWidget {
  const VerifyButtons({Key? key, required this.viewModel}) : super(key: key);

  final VerifyScreenViewModel viewModel;

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
          ],
        );
      },
    );
  }
}
