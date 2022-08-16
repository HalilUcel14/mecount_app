import 'package:account_app/core/enum/asset_enum.dart';
import 'package:account_app/screen/authentication/forgot/view/forgot_screen.dart';
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
              _emailFormField(constraints, context),
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
      labelStyle: context.textTheme.bodyText1?.copyWith(
        color: context.theme.primaryColorDark,
      ),
      hintText: viewModel.constants.passHintText,
      hintStyle: context.textTheme.bodyText1?.copyWith(
        color: context.theme.primaryColorDark,
      ),
      controller: viewModel.passController,
      logoIconName: AssetIcon.lock.string,
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
          //await context.pushNamed(AppRoutes.forgot);
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.height * 0.05),
                topRight: Radius.circular(context.height * 0.05),
              ),
            ),
            builder: (_) => ForgotScreen(),
          );
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

  SpecialTextFormField _emailFormField(
      BoxConstraints constraints, BuildContext context) {
    return SpecialTextFormField(
      focusNode: viewModel.emailFocus,
      labelText: viewModel.constants.emailLabelText,
      labelStyle: context.textTheme.bodyText1?.copyWith(
        color: context.theme.primaryColorDark,
      ),
      hintText: viewModel.constants.emailHintText,
      hintStyle: context.textTheme.bodyText1?.copyWith(
        color: context.theme.primaryColorDark,
      ),
      keyboardType: TextInputType.emailAddress,
      logoIconName: AssetIcon.mail.string,
      defaultHeight: constraints.maxHeight / 2.3,
      onSaved: (value) {
        viewModel.changeEmailText(value);
      },
      controller: viewModel.emailController,
    );
  }
}
