import 'package:account_app/screen/authentication/forgot/view_model/forgot_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/special_text_form_field.dart';

class ForgotFormField extends StatelessWidget {
  const ForgotFormField({Key? key, required this.viewModel}) : super(key: key);

  final ForgotScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: viewModel.formkey,
      child: SpecialTextFormField(
        defaultHeight: 80,
        logoIconName: viewModel.constants.mailIcon,
        controller: viewModel.emailController,
      ),
    );
  }
}
