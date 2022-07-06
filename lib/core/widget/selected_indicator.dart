import 'package:flutter/material.dart';

class MySelectedIndicator extends Row {
  MySelectedIndicator({
    required int length,
    required int currentIndex,
    double selectedSize = 20,
    double unSelectedSize = 14,
    Duration duration = const Duration(milliseconds: 250),
    double spaceBetween = 10,
    Color selectedColor = Colors.red,
    Color unSelectedColor = Colors.black,
    Curve curve = Curves.fastOutSlowIn,
    List<BoxShadow>? boxShadow,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.circle,
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Decoration? foregroundDecoration,
    BoxConstraints? constraints,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Widget? child,
    Clip clipBehavior = Clip.none,
    void Function()? onEnd,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) : super(
          key: key,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textBaseline: textBaseline,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          children: List.generate(
            length,
            (index) {
              //
              bool isIndex = index == currentIndex ? true : false;

              return AnimatedContainer(
                key: key,
                margin: currentIndex == length - 1
                    ? EdgeInsets.only(right: spaceBetween)
                    : null,
                curve: curve,
                duration: duration,
                height: isIndex ? selectedSize : unSelectedSize,
                width: isIndex ? selectedSize : unSelectedSize,
                decoration: BoxDecoration(
                  image: image,
                  border: border,
                  borderRadius: borderRadius,
                  boxShadow: boxShadow,
                  backgroundBlendMode: backgroundBlendMode,
                  gradient: gradient,
                  shape: shape,
                  color: isIndex ? selectedColor : unSelectedColor,
                ),
                transform: transform,
                transformAlignment: transformAlignment,
                child: child,
                clipBehavior: clipBehavior,
                onEnd: onEnd,
                foregroundDecoration: foregroundDecoration,
                alignment: alignment,
                padding: padding,
                constraints: constraints,
              );
            },
          ),
        );
}
