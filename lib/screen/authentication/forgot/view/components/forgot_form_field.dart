import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../core/enum/asset_enum.dart';
import '../../../../../core/widget/special_text_form_field.dart';
import '../../view_model/forgot_viewmodel.dart';

class ForgotFormField extends StatelessWidget {
  const ForgotFormField(
      {Key? key, required this.viewModel, this.baseEmailAddress})
      : super(key: key);

  final ForgotScreenViewModel viewModel;
  final String? baseEmailAddress;

  @override
  Widget build(BuildContext context) {
    viewModel.emailController.text = baseEmailAddress ?? '';
    return Form(
      key: viewModel.formKey,
      child: SpecialTextFormField(
        defaultHeight: context.height * 0.1,
        keyboardType: TextInputType.emailAddress,
        labelText: viewModel.constants.emailLabelText,
        labelStyle: context.textTheme.bodyText1?.copyWith(
          color: context.theme.primaryColorDark,
        ),
        hintText: viewModel.constants.emailHintText,
        hintStyle: context.textTheme.bodyText1?.copyWith(
          color: context.theme.primaryColorDark,
        ),
        logoIconName: AssetIcon.mail.string,
        controller: viewModel.emailController,
        onSaved: (value) => viewModel.changeEmailText(value ?? ''),
      ),
    );
  }
}
