import 'package:account_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

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
              _emailFormField(constraints),
              const Spacer(),
              _passwordFormField(constraints, context),
            ],
          );
        },
      ),
    );
  }

  SpecialTextFormField _passwordFormField(
      BoxConstraints constraints, BuildContext context) {
    return SpecialTextFormField(
      rightWidget: _forgotButton(constraints, context),
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
    );
  }

  Padding _forgotButton(BoxConstraints constraints, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextButton(
        onPressed: () async {
          await context.pushNamed(AppRoutes.forgot);
        },
        child: Text(
          viewModel.constants.forgot,
          style: context.textTheme.subtitle2?.copyWith(
            fontSize: constraints.maxHeight * 0.08,
            color: context.theme.primaryColor,
          ),
        ),
      ),
    );
  }

  SpecialTextFormField _emailFormField(BoxConstraints constraints) {
    return SpecialTextFormField(
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
    );
  }
}
