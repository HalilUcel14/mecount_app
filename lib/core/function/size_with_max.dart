import 'package:hucel_core/hucel_core.dart';
import 'package:flutter/material.dart';

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
