import 'package:flutter/cupertino.dart';
import 'package:hucel_core/hucel_core.dart';

import 'authentication_constants.dart';

class AuthenticationFunction {
  static final AuthencticationConstants constants =
      AuthencticationConstants.instance;
  //
  static bool emailValid({
    required String email,
    required BuildContext context,
  }) {
    if (!email.isValidEmail) {
      context.snackbar(errorList: [constants.errorEmailNotValid]);
      return false;
    } else if (email.length > 100) {
      context.snackbar(errorList: [constants.errorEmailLong]);
      return false;
    } else {
      return true;
    }
  }
}
