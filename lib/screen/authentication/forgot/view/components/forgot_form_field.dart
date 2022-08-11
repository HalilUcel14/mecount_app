import 'package:flutter/material.dart';

import '../../../../../core/widget/special_text_form_field.dart';
import '../../view_model/forgot_viewmodel.dart';

class ForgotFormField extends StatelessWidget {
  const ForgotFormField({Key? key, required this.viewModel}) : super(key: key);

  final ForgotScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: SpecialTextFormField(
        defaultHeight: 80,
        logoIconName: viewModel.constants.mailIcon,
        controller: viewModel.emailController,
        onSaved: (value) => viewModel.changeEmailText(value ?? ''),
      ),
    );
  }
}
