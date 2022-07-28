import 'package:flutter/material.dart';

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
              SpecialTextFormField(
                logoIconName: viewModel.constants.mailIcon,
                controller: viewModel.emailController,
                defaultHeight: formHeight,
                onSaved: (value) => viewModel.changeEmailText(value!),
              ),
              SpecialTextFormField(
                logoIconName: viewModel.constants.lockIcon,
                controller: viewModel.passController,
                defaultHeight: formHeight,
                onSaved: (value) => viewModel.changePassText(value!),
              ),
              SpecialTextFormField(
                logoIconName: viewModel.constants.lockIcon,
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
