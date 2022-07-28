import 'package:flutter/material.dart';

import '../login_constant.dart';

class LoginLogoAndTitle extends StatelessWidget {
  LoginLogoAndTitle({Key? key}) : super(key: key);

  final LoginConstant _loginConstant = LoginConstant.instance;
  //
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            const Spacer(),
            FlutterLogo(size: constraints.maxHeight * 0.5),
            const Spacer(flex: 2),
            _titleSubtitleText(context, constraints.maxHeight * 0.3),
            const Spacer(),
          ],
        );
      },
    );
  }

  RichText _titleSubtitleText(BuildContext context, double height) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '${_loginConstant.welcome}\n',
        style: TextStyle(
          fontSize: height * 0.42,
          color: Colors.black87,
        ),
        children: [
          TextSpan(
            text: _loginConstant.loginText,
            style: TextStyle(
              fontSize: height * 0.24,
            ),
          ),
        ],
      ),
    );
  }
}
