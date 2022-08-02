import 'package:flutter/material.dart';

import '../../../../../core/widget/special_text_form_field.dart';
import '../../viewmodel/login_view_model.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({Key? key, required this.viewModel}) : super(key: key);
  //
  final LoginScreenViewModel viewModel;

  //
  @override
  Widget build(BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Spacer(),
              // Email Form Field
              SpecialTextFormField(
                focusNode: viewModel.emailFocus,
                labelText: viewModel.constants.emailLabelText,
                hintText: viewModel.constants.emailHintText,
                keyboardType: TextInputType.emailAddress,
                logoIconName: viewModel.constants.mailIcon,
                defaultHeight: constraints.maxHeight / 2.3,
                onSaved: (value) {
                  viewModel.changeEmailText(value);
                },
                controller: viewModel.emailController,
              ),
              const Spacer(),
              // Password Form Field
              SpecialTextFormField(
                rightWidget: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot',
                      style: TextStyle(
                        fontSize: constraints.maxHeight * 0.08,
                      ),
                    ),
                  ),
                ),
                focusNode: viewModel.passFocus,
                obscureText: true,
                labelText: viewModel.constants.passLabelText,
                hintText: viewModel.constants.passHintText,
                controller: viewModel.passController,
                logoIconName: viewModel.constants.lockIcon,
                defaultHeight: constraints.maxHeight / 2.3,
                onSaved: (value) {
                  viewModel.changePassText(value);
                },
              ),
              //const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
