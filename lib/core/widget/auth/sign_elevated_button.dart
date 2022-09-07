import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

class SignElevatedButton extends StatelessWidget {
  const SignElevatedButton({
    Key? key,
    required this.buttonText,
    required this.fontSize,
    required this.size,
    required this.button,
  }) : super(key: key);

  final String buttonText;
  final double fontSize;
  final Size size;
  final Function() button;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButtonWithStadiumBorder(
        child: Text(
          buttonText,
          style: context.textTheme.subtitle2?.copyWith(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
        fixedSize: size,
        styleBackgroundColor: context.theme.primaryColor,
        onPressed: button,
      ),
    );
  }
}
