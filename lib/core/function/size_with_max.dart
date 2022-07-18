import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

double shortSizeWithMax(
  BuildContext context, {
  required double value,
  required double max,
}) {
  double sized = context.shortSize * value;
  return sized > max ? max : sized;
}

double longSizeWithMax(
  BuildContext context, {
  required double value,
  required double max,
}) {
  double sized = context.longSize * value;
  return sized > max ? max : sized;
}

SizedBox spacedHeight(double size, BuildContext context) =>
    SizedBox(height: context.dynamicShortSize(size));

double infinityWithMaxSize(double size) {
  return double.infinity > size ? size : double.infinity;
}
