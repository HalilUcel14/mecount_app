import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class IfHaveAnAccountButton extends StatelessWidget {
  const IfHaveAnAccountButton({
    Key? key,
    required this.accountText,
    required this.fontSize,
    required this.nextPageButtonText,
    required this.pathToPage,
  }) : super(key: key);

  final String accountText;
  final double fontSize;
  final String nextPageButtonText;
  final String pathToPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          accountText,
          style: context.textTheme.subtitle1?.copyWith(
            fontSize: fontSize,
            color: context.theme.primaryColor,
          ),
        ),
        TextButton(
          onPressed: () async {
            await context.pushNameAndRemoveUntil(pathToPage);
          },
          child: Text(
            nextPageButtonText,
            style: context.textTheme.subtitle2!.copyWith(
              fontSize: fontSize * 1.075,
              color: context.theme.primaryColorDark,
            ),
          ),
        ),
      ],
    );
  }
}
