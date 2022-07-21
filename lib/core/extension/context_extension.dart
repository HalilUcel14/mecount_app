import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../constants/shared_string.dart';

extension SharedContextExtension on BuildContext {
  SharedManager get sharedManager => SharedManager.instance;
  //
  bool get sharedManagerOnboard => sharedManager
      .getBoolPreferences(SharedConstants.instance.onboardFirstShowed);
}
