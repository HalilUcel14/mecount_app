import 'package:account_app/core/enum/asset_enum.dart';
import 'package:account_app/core/firebase/authentication/i_firebase_auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../Icon_logo.dart';

class SocialSignButtons extends StatelessWidget {
  const SocialSignButtons({
    Key? key,
    required this.size,
    required this.manager,
  }) : super(key: key);

  final FirebaseAuthManager manager;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => manager.signInWithFacebook(),
          child: IconsLogo.sgv(
            size: size,
            logoIconName: AssetIcon.socialFacebook.string,
            color: context.theme.primaryColor,
          ),
        ),
        InkWell(
          onTap: () => manager.signInWithGoogle(),
          child: IconsLogo.sgv(
            size: size,
            logoIconName: AssetIcon.socialGoogle.string,
            color: context.theme.primaryColor,
          ),
        ),
        InkWell(
          onTap: () => manager.signInWithTwitter(),
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
