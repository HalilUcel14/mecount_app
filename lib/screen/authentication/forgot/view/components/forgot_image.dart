import 'package:flutter/material.dart';

import '../../../../../core/enum/asset_enum.dart';
import '../../../../../core/widget/animate_lottie_builder.dart';

class ForgotLottieImage extends StatelessWidget {
  const ForgotLottieImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedLottieBuilder(
      iconPath: AssetLottieEnum.forgotPass.path,
    );
  }
}
