import 'package:account_app/core/widget/Icon_logo.dart';
import 'package:account_app/core/widget/special_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../viewmodel/login_view_model.dart';

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
          child: Container(
            padding: _context.padAllN,
            constraints: BoxConstraints(
              maxWidth:
                  ResponsivityConstants.instance.mediumScreenSize.toDouble(),
            ),
            child: Column(
              children: [
                _spaced(0.1),
                // Test Logo
                FlutterLogo(size: _context.dynamicShortSize(0.22)),
                _spaced(0.06),
                _titleSubtitleText(),
                _spaced(0.06),
                const SpecialTextFormField(
                  logoIconName: 'mail',
                  defouldHeight: 80,
                ),
                _spaced(0.04),
                const SpecialTextFormField(
                  logoIconName: 'lock',
                  defouldHeight: 80,
                ),
                _spaced(0.06),
                ElevatedButtonWithStadiumBorder(
                  child: const Text('Sign In'),
                  onPressed: () {},
                  fixedSize: Size(
                    _context.dynamicShortSize(0.3),
                    _context.dynamicShortSize(0.10),
                  ),
                ),
                _spaced(0.14),
                Row(
                  children: [
                    _divider(),
                    const Text("Or sign in with"),
                    _divider(),
                  ],
                ),
                _spaced(0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    IconsLogo(size: 60, logoIconName: 'social_facebook'),
                    IconsLogo(size: 60, logoIconName: 'social_google'),
                    IconsLogo(size: 60, logoIconName: 'social_twitter'),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(onPressed: () {}, child: const Text('Sign Up'))
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Expanded _divider() {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: const Divider(
        color: Colors.black,
        thickness: 1,
      ),
    ));
  }

  SizedBox _spaced(double size) =>
      SizedBox(height: _context.dynamicShortSize(size));

  RichText _titleSubtitleText() {
    return RichText(
      textAlign: TextAlign.center,
      strutStyle: StrutStyle(fontSize: _context.dynamicShortSize(0.05)),
      text: TextSpan(
        text: "Welcome Back!\n",
        style: TextStyle(
          fontSize: _context.dynamicShortSize(0.06),
          color: Colors.black54,
        ),
        children: [
          TextSpan(
            text: "Login to your account",
            style: TextStyle(fontSize: _context.dynamicShortSize(0.036)),
          ),
        ],
      ),
    );
  }
}
