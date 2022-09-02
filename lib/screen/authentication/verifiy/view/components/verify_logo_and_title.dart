import 'package:flutter/material.dart';

import '../../../../../core/widget/auth/title_subtitle_text.dart';
import '../../view_model/verify_viewmodel.dart';

class VerifyLogoAndTitle extends StatelessWidget {
  const VerifyLogoAndTitle({Key? key, required this.viewModel})
      : super(key: key);

  final VerifyScreenViewModel viewModel;

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
            _titleSubtitleText(context, constraints.maxHeight * 0.35),
            const Spacer(),
          ],
        );
      },
    );
  }

  Widget _titleSubtitleText(BuildContext context, double height) {
    return AuthHeadTitle(
      title: viewModel.constants.verifyTitle,
      subTitle: viewModel.constants.verifySubtitle,
      fontSize: height * 0.42,
    );
  }
}
