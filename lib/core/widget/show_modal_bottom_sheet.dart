import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class CustomShowModelBottomSheet {
  Future<void> sheet(BuildContext context, {required Widget child}) {
    return showModalBottomSheet(
      constraints: BoxConstraints(
          maxWidth: ResponsivityConstants.instance.mediumScreenSize.toDouble()),
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
