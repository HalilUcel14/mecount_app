import 'package:flutter/material.dart';
import '../../viewmodel/login_view_model.dart';
import 'package:hucel_core/hucel_core.dart';

class LoginLogoAndTitle extends StatelessWidget {
  const LoginLogoAndTitle({Key? key, required this.viewModel})
      : super(key: key);

  final LoginScreenViewModel viewModel;

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
        text: '${viewModel.constants.loginTitle}\n',
        style: context.theme.textTheme.titleMedium!.copyWith(
          fontSize: height * 0.42,
        ),
        children: [
          TextSpan(
            text: viewModel.constants.loginSubTitle,
            style: context.theme.textTheme.titleSmall!.copyWith(
              fontSize: height * 0.24,
            ),
          ),
        ],
      ),
    );
  }
}
