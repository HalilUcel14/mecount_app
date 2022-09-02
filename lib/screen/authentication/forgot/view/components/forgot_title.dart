import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../core/widget/auth/title_subtitle_text.dart';
import '../../view_model/forgot_viewmodel.dart';

class ForgotTitleSubTitle extends StatelessWidget {
  const ForgotTitleSubTitle({Key? key, required this.viewModel})
      : super(key: key);

  final ForgotScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AuthHeadTitle(
      title: viewModel.constants.forgotTitle,
      subTitle: viewModel.constants.forgotSubTitle,
      fontSize: context.height * 0.03,
    );
  }
}
