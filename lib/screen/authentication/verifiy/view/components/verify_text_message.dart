import 'package:hucel_core/hucel_core.dart';
import 'package:flutter/material.dart';

import '../../view_model/verify_viewmodel.dart';

class VerifyTextColumn extends StatelessWidget {
  const VerifyTextColumn({Key? key, required this.viewModel}) : super(key: key);

  final VerifyScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'We sent a confirmation email to:',
            style: context.textTheme.subtitle1?.copyWith(
              fontSize: constraints.maxHeight * 0.075,
            ),
          ),
          _sizedBox(constraints),
          Text(
            '${viewModel.authManager.currentUser!.email}',
            style: context.textTheme.headline6?.copyWith(
              fontSize: constraints.maxHeight * 0.075,
            ),
          ),
          _sizedBox(constraints),
          Text(
            'Check your email and click on the confirmation link to continue.',
            textAlign: TextAlign.center,
            style: context.textTheme.subtitle1?.copyWith(
              fontSize: constraints.maxHeight * 0.06,
            ),
          ),
        ],
      );
    });
  }

  SizedBox _sizedBox(BoxConstraints constraints) =>
      SizedBox(height: constraints.maxHeight * 0.03);
}
