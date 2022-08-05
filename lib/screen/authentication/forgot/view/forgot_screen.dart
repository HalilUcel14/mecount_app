import 'package:account_app/core/widget/auth/sign_elevated_button.dart';
import 'package:account_app/core/widget/auth/title_subtitle_text.dart';
import 'package:account_app/core/widget/special_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../view_model/forgot_viewmodel.dart';
import 'package:lottie/lottie.dart';

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
        child: Container(
          padding: _context.padAllN,
          constraints: BoxConstraints(
            maxWidth:
                ResponsivityConstants.instance.mediumScreenSize.toDouble(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_IUWMcw.json',
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const AuthHeadTitle(
                      title: 'Please enter your Email',
                      subTitle:
                          'and we send a mail for you reset password link',
                      fontSize: 24,
                    ),
                    Form(
                      child: SpecialTextFormField(
                        logoIconName: _viewModel!.constants.mailIcon,
                        controller: _viewModel!.emailcontroller,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  SignElevatedButton(
                    buttonText: 'Send Email',
                    fontSize: 16,
                    size: const Size(120, 30),
                    button: _viewModel!.pressButton,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  // Scaffold _scaffold() {
  //   return Scaffold(
  //       body: Center(
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Spacer(
  //             flex: 6,
  //           ),
  //           const Text('Forgot PassWord'),
  //           const Spacer(
  //             flex: 2,
  //           ),
  //           Form(
  //             key: _viewModel!.formkey,
  //             child: SpecialTextFormField(
  //               controller: _viewModel!.emailcontroller,
  //               logoIconName: _viewModel!.constants.mailIcon,
  //             ),
  //           ),
  //           const Spacer(
  //             flex: 2,
  //           ),
  //           _forgotButton(),
  //           const Spacer(
  //             flex: 6,
  //           ),
  //         ],
  //       ),
  //     ),
  //   ));
  // }

  // ElevatedButtonWithStadiumBorder _forgotButton() {
  //   return ElevatedButtonWithStadiumBorder(
  //     child: const Text("Send Email"),
  //     onPressed: _viewModel!.pressButton,
  //   );
  // }
}
