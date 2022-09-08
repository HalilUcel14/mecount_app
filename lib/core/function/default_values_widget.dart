import 'package:flutter/cupertino.dart';
import 'package:hucel_core/hucel_core.dart';

class DefaultValuesOfWidget {
  BoxConstraints get authConstraints => BoxConstraints(
        maxWidth:
            ResponsivityConstants.instance.mediumScreenSize.toDouble() * 0.75,
      );
}
