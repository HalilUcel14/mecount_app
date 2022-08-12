import 'package:account_app/core/widget/default_container_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../view_model/register_viewmodel.dart';
import 'components/register_button.dart';
import 'components/register_form_field.dart';
import 'components/register_logo_title.dart';

// ignore: must_be_immutable
class RegisterScreen extends BaseStateless {
  RegisterScreen({Key? key}) : super(key: key);
  late RegisterScreenViewModel _viewModel;
  late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterScreenViewModel>(
      viewModel: RegisterScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, RegisterScreenViewModel viewModel) {
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
            child: DefaultContainerCreateScreen(
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: RegisterLogoAndTitle(viewModel: _viewModel)),
                  Expanded(
                      flex: 4, child: RegisterFormField(viewModel: _viewModel)),
                  Expanded(
                      flex: 3, child: RegisterButtons(viewModel: _viewModel)),
                ],
              ),
            ),
          ),
        ),
      );
}
