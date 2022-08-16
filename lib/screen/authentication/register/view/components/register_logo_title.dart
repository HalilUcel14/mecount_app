import 'package:account_app/core/widget/auth/title_subtitle_text.dart';
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

  Widget _titleSubtitleText(BuildContext context, double height) {
    return AuthHeadTitle(
      title: viewModel.constants.registerTitle,
      subTitle: viewModel.constants.registerSubTitle,
      fontSize: height * 0.5,
    );
  }
}
