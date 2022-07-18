import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({Key? key, this.mobile, this.desktopWeb})
      : super(key: key);

  final Widget? mobile;
  final Widget? desktopWeb;

  @override
  Widget build(BuildContext context) {
    bool isAndroid = defaultTargetPlatform == TargetPlatform.android;
    bool isIos = defaultTargetPlatform == TargetPlatform.iOS;

    if (isAndroid || isIos) {
      // is Mobile
      return mobile ?? const SizedBox.shrink();
    } else {
      return desktopWeb ?? const SizedBox.shrink();
    }
  }
}
