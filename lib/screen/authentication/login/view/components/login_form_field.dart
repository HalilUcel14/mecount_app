import 'package:flutter/material.dart';

import '../../../../../core/widget/special_text_form_field.dart';
import '../../viewmodel/login_view_model.dart';
import '../login_constant.dart';

class LoginFormField extends StatelessWidget {
  LoginFormField({Key? key, required this.viewModel}) : super(key: key);
  //
  final LoginScreenViewModel viewModel;
  final LoginConstant _loginConstant = LoginConstant.instance;
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
              SpecialTextFormField(
                keyboardType: TextInputType.emailAddress,
                logoIconName: _loginConstant.mailIcon,
                defaultHeight: constraints.maxHeight / 2.3,
                onSaved: (value) {
                  viewModel.changeEmailText(value);
                },
                controller: viewModel.emailController,
              ),
              const Spacer(),
              SpecialTextFormField(
                controller: viewModel.passController,
                logoIconName: _loginConstant.passIcon,
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
