import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class AuthHeadTitle extends StatelessWidget {
  const AuthHeadTitle({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.fontSize,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '$title\n',
        style: context.textTheme.headline6?.copyWith(
          fontSize: fontSize,
          color: context.theme.primaryColorDark,
        ),
        // style: TextStyle(
        //   fontSize: fontSize,
        //   color: Colors.black87,
        // ),
        children: [
          TextSpan(
            text: subTitle,
            style: context.textTheme.subtitle1?.copyWith(
              fontSize: fontSize / 1.75,
              color: context.theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
