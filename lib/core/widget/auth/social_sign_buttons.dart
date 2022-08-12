import 'package:account_app/core/enum/asset_enum.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../Icon_logo.dart';

class SocialSignButtons extends StatelessWidget {
  const SocialSignButtons({
    Key? key,
    required this.viewModel,
    required this.size,
  }) : super(key: key);

  final dynamic viewModel;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {},
          child: IconsLogo.sgv(
            size: size,
            logoIconName: AssetIcon.socialGoogle.pathSvg,
            color: context.theme.primaryColor,
          ),
        ),
        InkWell(
          onTap: () {},
          child: IconsLogo.sgv(
            size: size,
            logoIconName: AssetIcon.socialGoogle.pathSvg,
            color: context.theme.primaryColor,
          ),
        ),
        InkWell(
          onTap: () {},
          child: IconsLogo.sgv(
            size: size,
            logoIconName: AssetIcon.socialGoogle.pathSvg,
            color: context.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
