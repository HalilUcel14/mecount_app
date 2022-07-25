import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

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

  BoxDecoration detailCard(BoxConstraints constraints) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(constraints.maxHeight * 0.1),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: constraints.maxHeight * 0.05,
            color: Colors.grey,
            blurStyle: BlurStyle.solid,
          ),
        ],
      );
}
