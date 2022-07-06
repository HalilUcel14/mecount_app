import 'package:flutter/material.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/function/size_with_max.dart';
import '../onboard_constants.dart';

class OnboardImageCard extends StatelessWidget {
  const OnboardImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
        ),
        _skipButton(context)
      ],
    );
  }

  Positioned _skipButton(BuildContext context) {
    return Positioned(
      right: shortSizeWithMax(context, value: 0.1, max: 24),
      top: shortSizeWithMax(context, value: 0.1, max: 24),
      child: ElevatedButtonWithStadiumBorder(
        styleBackgroundColor: Colors.transparent,
        child: Text(
          OnBoardConstants.instance.skip,
          style: OnBoardConstants.instance.skipStyle(context),
        ),
        fixedSize: Size(
          shortSizeWithMax(context, value: 0.3, max: 90),
          shortSizeWithMax(context, value: 0.1, max: 30),
        ),
        onPressed: () {},
      ),
    );
  }
}
