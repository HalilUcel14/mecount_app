import 'package:account_app/screen/authentication/register/view/register_constant.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/special_text_form_field.dart';
import '../../view_model/register_viewmodel.dart';

class RegisterFormField extends StatelessWidget {
  const RegisterFormField({Key? key, required this.viewModel})
      : super(key: key);
  final RegisterScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    //
    RegisterConstant registerConstant = RegisterConstant.instance;
    //
    return Form(
      key: viewModel.formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          //
          final double formHeight = constraints.maxHeight * 0.285;
          //
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpecialTextFormField(
                labelText: registerConstant.emailLabel,
                hintText: registerConstant.emailHint,
                logoIconName: viewModel.constant.mailIcon,
                controller: viewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                defaultHeight: formHeight,
                onSaved: (value) => viewModel.changeEmailText(value!),
              ),
              SpecialTextFormField(
                obscureText: true,
                labelText: registerConstant.passLabel,
                hintText: registerConstant.passHint,
                logoIconName: viewModel.constant.passIcon,
                controller: viewModel.passController,
                defaultHeight: formHeight,
                onSaved: (value) => viewModel.changePassText(value!),
              ),
              SpecialTextFormField(
                obscureText: true,
                labelText: registerConstant.passLabel,
                hintText: registerConstant.passHint,
                logoIconName: viewModel.constant.passIcon,
                controller: viewModel.confirmController,
                defaultHeight: formHeight,
                onSaved: (value) => viewModel.changeConfirmText(value!),
              ),
            ],
          );
        },
      ),
    );
  }
}
