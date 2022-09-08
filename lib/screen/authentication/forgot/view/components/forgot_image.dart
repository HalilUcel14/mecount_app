import 'package:flutter/material.dart';

import '../../../../../core/enum/asset_enum.dart';
import '../../../../../core/widget/animate_lottie_builder.dart';

class ForgotLottieImage extends StatelessWidget {
  const ForgotLottieImage({Key? key, required this.maxContainerHeight})
      : super(key: key);

  final double maxContainerHeight;

  @override
  Widget build(BuildContext context) {
    return AnimatedLottieAssetBuilder(
      iconPath: AssetLottieEnum.forgotPass.path,
      height: maxContainerHeight * 0.5,
      width: maxContainerHeight * 0.5,
    );
  }
}
