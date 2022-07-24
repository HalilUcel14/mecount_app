import 'package:flutter/material.dart';

import '../../view_model/register_viewmodel.dart';

class RegisterLogoAndTitle extends StatelessWidget {
  const RegisterLogoAndTitle({Key? key, required this.viewModel})
      : super(key: key);

  final RegisterScreenViewModel viewModel;

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
        text: '${viewModel.constant.registerTitle}\n',
        style: TextStyle(
          fontSize: height * 0.42,
          color: Colors.black87,
        ),
        children: [
          TextSpan(
            text: viewModel.constant.registerSubTitle,
            style: TextStyle(
              fontSize: height * 0.24,
            ),
          ),
        ],
      ),
    );
  }
}
