import 'package:account_app/core/constants/shared_string.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

extension SharedContextExtension on BuildContext {
  SharedManager get sharedManager => SharedManager.instance;
  //
  bool get sharedManagerOnboard => sharedManager
      .getBoolPreferences(SharedConstants.instance.onboardFirstShowed);
}
