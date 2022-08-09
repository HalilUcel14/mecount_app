import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class DividerWithText extends StatelessWidget {
  DividerWithText({
    Key? key,
    required this.dividerText,
    required this.fontSize,
    this.dividerColor,
    this.margin,
    this.thickness,
  }) : super(key: key);

  final String dividerText;
  final double fontSize;
  Color? dividerColor;
  double? thickness;
  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _divider(),
        Text(
          dividerText,
          style: context.textTheme.bodyText2?.copyWith(
            fontSize: fontSize,
            color: context.theme.primaryColorDark,
          ),
        ),
        _divider(),
      ],
    );
  }

  Expanded _divider() {
    return Expanded(
      child: Container(
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 15),
        child: Divider(
          color: dividerColor ?? Colors.black,
          thickness: thickness ?? 1,
        ),
      ),
    );
  }
}
