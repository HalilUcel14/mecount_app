import 'package:account_app/core/enum/asset_enum.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../Icon_logo.dart';

class SocialSignButtons extends StatelessWidget {
  const SocialSignButtons({
    Key? key,
    required this.size,
    required this.facebook,
    required this.google,
    required this.twitter,
  }) : super(key: key);

  final double size;
  final VoidCallback facebook;
  final VoidCallback google;
  final VoidCallback twitter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: facebook,
          child: IconsLogo.sgv(
            size: size,
            logoIconName: AssetIcon.socialFacebook.string,
            color: context.theme.primaryColor,
          ),
        ),
        InkWell(
          onTap: google,
          child: IconsLogo.sgv(
            size: size,
            logoIconName: AssetIcon.socialGoogle.string,
            color: context.theme.primaryColor,
          ),
        ),
        InkWell(
          onTap: twitter,
          child: IconsLogo.sgv(
            size: size,
            logoIconName: AssetIcon.socialTwitter.string,
            color: context.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
