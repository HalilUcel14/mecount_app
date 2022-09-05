import 'package:flutter/material.dart';

import '../../../../../core/enum/asset_enum.dart';
import '../../../../../core/widget/special_text_form_field.dart';
import '../../view_model/register_viewmodel.dart';

class RegisterFormField extends StatelessWidget {
  const RegisterFormField({Key? key, required this.viewModel})
      : super(key: key);
  final RegisterScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
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
              // Email Form Field
              SpecialTextFormField(
                focusNode: viewModel.emailFocus,
                labelText: viewModel.constants.emailLabelText,
                hintText: viewModel.constants.emailHintText,
                logoIconName: AssetIcon.mail.string,
                controller: viewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                defaultHeight: formHeight,
                onSaved: (value) => viewModel.changeEmailText(value!),
              ),
              // Password Form Field
              SpecialTextFormField(
                focusNode: viewModel.passFocus,
                obscureText: true,
                labelText: viewModel.constants.passLabelText,
                hintText: viewModel.constants.passHintText,
                logoIconName: AssetIcon.lock.string,
                controller: viewModel.passController,
                defaultHeight: formHeight,
                onSaved: (value) => viewModel.changePassText(value!),
              ),
              // Confirm Form Field
              SpecialTextFormField(
                focusNode: viewModel.confirmFocus,
                obscureText: true,
                labelText: viewModel.constants.passLabelText,
                hintText: viewModel.constants.passHintText,
                logoIconName: AssetIcon.lock.string,
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
