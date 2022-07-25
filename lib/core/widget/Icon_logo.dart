// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hucel_core/hucel_core.dart';

class IconsLogo extends StatelessWidget {
  const IconsLogo({
    Key? key,
    required this.size,
    required this.logoIconName,
    this.color = Colors.blue,
  }) : super(key: key);

  final double size;
  final String logoIconName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Padding(
        padding: EdgeInsets.all(size * 0.30),
        child: SvgPicture.asset(logoIconName.getSvgIcon, color: color),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: context.dynamicShortSize(0.02),
            blurStyle: BlurStyle.solid,
            offset: const Offset(1, -1),
            color: Colors.grey,
          ),
          BoxShadow(
            blurRadius: context.dynamicShortSize(0.02),
            blurStyle: BlurStyle.solid,
            offset: const Offset(-1, 1),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
