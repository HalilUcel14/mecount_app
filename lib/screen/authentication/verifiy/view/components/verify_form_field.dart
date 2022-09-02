import 'package:flutter/cupertino.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../core/enum/asset_enum.dart';
import '../../../../../core/widget/special_text_form_field.dart';
import '../../view_model/verify_viewmodel.dart';

class VerifyFormField extends StatelessWidget {
  const VerifyFormField({Key? key, required this.viewModel}) : super(key: key);

  final VerifyScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: SpecialTextFormField(
        defaultHeight: context.height * 0.1,
        logoIconName: AssetIcon.mail.string,
        controller: viewModel.emailController,
        keyboardType: TextInputType.emailAddress,
        labelText: viewModel.constants.emailLabelText,
        labelStyle: context.textTheme.bodyText1?.copyWith(
          color: context.theme.primaryColorDark,
        ),
        hintText: viewModel.constants.emailHintText,
        hintStyle: context.textTheme.bodyText1?.copyWith(
          color: context.theme.primaryColorDark,
        ),
        onSaved: (value) => viewModel.changeEmailText(value ?? ''),
      ),
    );
  }
}
