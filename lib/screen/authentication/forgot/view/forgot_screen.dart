import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../core/widget/special_text_form_field.dart';
import '../view_model/forgot_viewmodel.dart';

class ForgotScreen extends BaseStateless {
  ForgotScreen({Key? key}) : super(key: key);
  //
  late ForgotScreenViewModel? _viewModel;
  late BuildContext _context;
  //
  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotScreenViewModel>(
      viewModel: ForgotScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ForgotScreenViewModel viewModel) {
        _viewModel = viewModel;
        _context = context;
        return _scaffold();
      },
      onDispose: () {
        _viewModel?.emailcontroller.dispose();
        _viewModel?.emailFocus.dispose();
      },
    );
  }

  Scaffold _scaffold() {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 6,
            ),
            Text('Forgot PassWord'),
            Spacer(
              flex: 2,
            ),
            Form(
              key: _viewModel!.formkey,
              child: SpecialTextFormField(
                controller: _viewModel!.emailcontroller,
                logoIconName: _viewModel!.constants.mailIcon,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            _forgotButton(),
            Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    ));
  }

  ElevatedButtonWithStadiumBorder _forgotButton() {
    return ElevatedButtonWithStadiumBorder(
      child: const Text("Send Email"),
      onPressed: _viewModel!.pressButton,
    );
  }
}
