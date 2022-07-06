import 'package:flutter/material.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/function/size_with_max.dart';

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
      right: shortSizeWithMax(context, value: 0.2, max: 30),
      top: shortSizeWithMax(context, value: 0.2, max: 30),
      child: ElevatedButtonWithStadiumBorder(
        styleBackgroundColor: Colors.transparent,
        child: const Text(
          "Skip",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
