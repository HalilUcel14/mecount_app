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
        builder: (context, constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SpecialTextFormField(
              logoIconName: viewModel.constant.mailIcon,
              controller: viewModel.emailController,
              defaultHeight: constraints.maxHeight * 0.30,
              onSaved: (value) => viewModel.changeEmailText(value!),
            ),
            SpecialTextFormField(
              logoIconName: viewModel.constant.passIcon,
              controller: viewModel.passController,
              defaultHeight: constraints.maxHeight * 0.30,
              onSaved: (value) => viewModel.changePassText(value!),
            ),
            SpecialTextFormField(
              logoIconName: viewModel.constant.passIcon,
              controller: viewModel.confirmController,
              defaultHeight: constraints.maxHeight * 0.30,
              onSaved: (value) => viewModel.changeConfirmText(value!),
            ),
          ],
        ),
      ),
    );
  }
}
