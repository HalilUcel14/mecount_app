import 'package:flutter/material.dart';

import '../firebase/authentication/i_firebase_auth_manager.dart';

extension LottieAssetExtension on String {
  String get getLottie => 'assets/lottie/${this}.json';
}

extension FirebaseUserExtension on BuildContext {
  bool get isUserExist =>
      FirebaseAuthManager.auth.currentUser != null ? true : false;
}
