// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ScreenSizeSelector extends StatelessWidget {
  const ScreenSizeSelector(
      {Key? key, this.XSWidget, this.SWidget, this.MWidget, this.LWidget})
      : super(key: key);
  //
  final Widget? XSWidget; // 0 - 300 Width
  final Widget? SWidget; // 300 - 600 Width
  final Widget? MWidget; // 600 - 900 Width
  final Widget? LWidget; // 900 + Width
  //
  @override
  Widget build(BuildContext context) {
    if (context.isSmallScreen) {
      return XSWidget ?? _emptyWidget("Small");
    } else if (context.isNormalyScreen) {
      return SWidget ?? _emptyWidget("Normaly");
    } else if (context.isMediumScreen) {
      return MWidget ?? _emptyWidget("Medium");
    } else {
      return LWidget ?? _emptyWidget("Large");
    }
  }

  Widget _emptyWidget(String text) => SizedBox(child: Text("$text Screen"));
}
