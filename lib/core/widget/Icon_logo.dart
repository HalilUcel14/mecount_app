// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hucel_core/hucel_core.dart';

class IconsLogo extends StatelessWidget {
  IconsLogo.sgv({
    Key? key,
    required this.size,
    required this.logoIconName,
    this.color,
  }) : super(key: key);

  IconsLogo.icon({
    Key? keys,
    required this.size,
    required this.icon,
    this.color,
  }) : super(key: keys);

  final double size;
  String? logoIconName;
  Widget? icon;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: icon ??
          Padding(
            padding: EdgeInsets.all(size * 0.30),
            child: SvgPicture.asset(logoIconName!.getSvgIcon, color: color),
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
