import 'package:account_app/core/function/default_values_widget.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class CustomShowModelBottomSheet {
  Future<void> sheet(BuildContext context, {required Widget child}) {
    return showModalBottomSheet(
      constraints: DefaultValuesOfWidget().authConstraints,
      isScrollControlled: true,
      context: context,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.height * 0.05),
          topRight: Radius.circular(context.height * 0.05),
        ),
      ),
      builder: (_) => child,
    );
  }
}
