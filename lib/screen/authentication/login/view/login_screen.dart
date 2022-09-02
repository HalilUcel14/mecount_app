import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../core/widget/default_container_screen_widget.dart';
import '../viewmodel/login_view_model.dart';
import 'components/login_buttons.dart';
import 'components/login_form_field.dart';
import 'components/login_logo_title.dart';

// ignore: must_be_immutable
class LoginScreen extends BaseStateless {
  LoginScreen({Key? key}) : super(key: key);
  //
  late LoginScreenViewModel _viewModel;
  //late BuildContext _context;
  //
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginScreenViewModel>(
      viewModel: LoginScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginScreenViewModel viewModel) {
        _viewModel = viewModel;
        //_context = context;
        return _scaffold();
      },
      onDispose: () {
        _viewModel.passController.dispose();
        _viewModel.emailController.dispose();

        _viewModel.emailFocus.dispose();
        _viewModel.passFocus.dispose();
      },
    );
  }

  Scaffold _scaffold() => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: DefaultContainerCreateScreen(
            child: Column(
              children: [
                Expanded(
                  child: LoginLogoAndTitle(viewModel: _viewModel),
                  flex: 2,
                ),
                Expanded(
                  child: LoginFormField(viewModel: _viewModel),
                  flex: 2,
                ),
                Expanded(
                  child: LoginFormButtons(viewModel: _viewModel),
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      );
}
