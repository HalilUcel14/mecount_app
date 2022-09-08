import 'package:account_app/core/function/default_values_widget.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class DefaultContainerCreateScreen extends StatelessWidget {
  const DefaultContainerCreateScreen({
    Key? key,
    this.padding,
    this.constraints,
    this.alignment,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;
  final Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: padding ?? context.padAllN,
        constraints: constraints ?? DefaultValuesOfWidget().authConstraints,
        alignment: alignment,
        child: Center(child: child),
        clipBehavior: clipBehavior!,
        color: color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        height: height,
        key: key,
        margin: margin,
        transform: transform,
        transformAlignment: transformAlignment,
        width: width,
      ),
    );
  }
}
