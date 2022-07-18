import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class HomeMenuDrawer extends StatelessWidget {
  const HomeMenuDrawer({Key? key, required this.constraints}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.red),
      width: 200,
    ).toVisible(
      ResponsivityConstants.instance.mediumScreenSize >= constraints.maxWidth
          ? false
          : true,
    );
  }
}
