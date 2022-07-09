import 'package:flutter/material.dart';

import '../../../../../core/constants/easy_locale.dart';
import '../../../../core/function/size_with_max.dart';

class OnBoardConstants {
  static OnBoardConstants? _instance;
  static OnBoardConstants get instance {
    _instance ??= OnBoardConstants._init();
    return _instance!;
  }

  OnBoardConstants._init();

  String previous = 'Previous'.easyLocale;
  String next = 'Next'.easyLocale;
  String skip = 'Skip'.easyLocale;

  BoxDecoration detailCard(BuildContext context) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            shortSizeWithMax(context, value: 0.2, max: 36),
          ),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Colors.grey,
            blurStyle: BlurStyle.solid,
          ),
        ],
      );

  TextStyle previousTextStyle(BuildContext context) => TextStyle(
        fontSize: shortSizeWithMax(context, value: 0.2, max: 18),
      );
  TextStyle titleStyle(BuildContext context) => TextStyle(
        fontSize: shortSizeWithMax(context, value: 0.15, max: 36),
        fontWeight: FontWeight.bold,
      );
  TextStyle subTitleStyle(BuildContext context) => TextStyle(
        color: Colors.black54,
        fontSize: shortSizeWithMax(context, value: 0.05, max: 18),
      );
  TextStyle skipStyle(BuildContext context) => TextStyle(
        fontSize: shortSizeWithMax(context, value: 0.08, max: 20),
      );
}
