import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../model/onboard_model.dart';
import '../onboard_constants.dart';

class OnboardImageCard extends StatelessWidget {
  const OnboardImageCard({Key? key, required this.model}) : super(key: key);

  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: constraints.maxHeight * 0.2,
              left: constraints.maxWidth * 0.1,
              right: constraints.maxWidth * 0.1,
            ),
            child: Image.asset(model.imgUrl!),
          ),
          _skipButton(context, constraints)
        ],
      );
    });
  }

  Positioned _skipButton(BuildContext context, BoxConstraints constraints) {
    return Positioned(
      right: constraints.maxWidth * 0.05,
      top: constraints.maxHeight * 0.05,
      child: ElevatedButtonWithStadiumBorder(
        styleBackgroundColor: Colors.red,
        child: Text(
          OnBoardConstants.instance.skip,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: constraints.maxWidth * 0.04),
        ),
        fixedSize: Size(
          constraints.maxWidth * 0.25,
          constraints.maxHeight * 0.1,
        ),
        onPressed: () async {
          // Onboard ekran Görünme Ortamını True yapar ve uygulama boyunca 1 defa görünür.
          await context.setOnboardFirstTimeShowed;
          // Geri Dönülmeyen bir yapı ile navigate yapar.
          await context.pushNameAndRemoveUntil(AppRoutes.login);
        },
      ),
    );
  }
}
