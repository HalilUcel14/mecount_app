import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

ScaffoldFeatureController snackbarTested({
  required List<String> errorList,
  required BuildContext context,
  Key? snackbarKey,
  Key? mainBodyKey,
  double snackbarElevations = 0.0,
  SnackBarBehavior? snackBarBehavior = SnackBarBehavior.floating,
  SnackBarAction? snackbarAction,
  Animation<double>? snackbarAnimation,
  Clip snackbarClipBehavior = Clip.hardEdge,
  EdgeInsetsGeometry? snackbarMargin,
  void Function()? snackbaronVisible,
  EdgeInsetsGeometry? snackbarPadding,
  ShapeBorder? snackbarShape,
  double? snackbarWidth,
  DismissDirection snackbarDismissDirection = DismissDirection.down,
  Decoration? mainBodyDecoration,
  TextStyle? errorTextStyle,
  Color? mainBodyDecorationColor,
  String? labelChar,
  String? labelText,
  TextStyle? labelTextStyle,
  TextStyle? labelCharStyle,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      ErrorSnackbars(
        errorTextStyle: errorTextStyle,
        labelChar: labelChar,
        labelCharStyle: labelCharStyle,
        labelText: labelText,
        labelTextStyle: labelTextStyle,
        mainBodyDecoration: mainBodyDecoration,
        mainBodyDecorationColor: mainBodyDecorationColor,
        mainBodyKey: mainBodyKey,
        snackBarBehavior: snackBarBehavior,
        snackbarAction: snackbarAction,
        snackbarAnimation: snackbarAnimation,
        snackbarClipBehavior: snackbarClipBehavior,
        snackbarDismissDirection: snackbarDismissDirection,
        snackbarElevations: snackbarElevations,
        snackbarKey: snackbarKey,
        snackbarMargin: snackbarMargin,
        snackbarPadding: snackbarPadding,
        snackbarShape: snackbarShape,
        snackbarWidth: snackbarWidth,
        snackbaronVisible: snackbaronVisible,
        errorList: errorList,
      ),
    );