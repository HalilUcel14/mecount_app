import 'package:account_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/constants/shared_string.dart';
import '../../../../../core/function/size_with_max.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../model/onboard_model.dart';
import '../onboard_constants.dart';

class OnboardImageCard extends StatelessWidget {
  const OnboardImageCard({Key? key, required this.model}) : super(key: key);

  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.padAllS,
          child: Container(
            margin: context.padAllN,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(model.imgUrl!),
              ),
            ),
          ),
        ),
        _skipButton(context)
      ],
    );
  }

  Positioned _skipButton(BuildContext context) {
    return Positioned(
      right: shortSizeWithMax(context, value: 0.1, max: 12),
      top: shortSizeWithMax(context, value: 0.1, max: 12),
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
        onPressed: () async {
          // Onboard ekran Görünme Ortamını True yapar ve uygulama boyunca 1 defa görünür.
          var firstTime = SharedConstants.instance.onboardFirstShowed;
          await context.sharedManager.setBoolValue(firstTime, true);
          // Geri Dönülmeyen bir yapı ile navigate yapar.
          context.navigateToReset(AppRoutes.login);
        },
      ),
    );
  }
}
