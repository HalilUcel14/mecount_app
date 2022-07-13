import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../viewmodel/login_view_model.dart';
import 'components/login_buttons.dart';
import 'components/login_form_field.dart';
import 'components/login_logo_title.dart';

class LoginScreen extends BaseStateless {
  LoginScreen({Key? key}) : super(key: key);
  late LoginScreenViewModel _viewModel;
  late BuildContext _context;
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
        _context = context;
        return _scaffold();
      },
    );
  }

  Scaffold _scaffold() => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Container(
              padding: _context.padAllN,
              constraints: BoxConstraints(
                maxWidth:
                    ResponsivityConstants.instance.mediumScreenSize.toDouble(),
              ),
              child: Column(
                children: [
                  Expanded(child: LoginLogoAndTitle(), flex: 2),
                  Expanded(
                      child: LoginFormField(viewModel: _viewModel), flex: 2),
                  Expanded(
                      child: LoginFormButtons(viewModel: _viewModel), flex: 3),
                ],
              ),
            ),
          ),
        ),
      );
}
