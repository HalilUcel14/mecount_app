import 'package:account_app/core/firebase/authentication/i_firebase_auth_manager.dart';
import 'package:flutter/material.dart';

extension LottieAssetExtension on String {
  String get getLottie => 'assets/lottie/${this}.json';
}

extension FirebaseUserExtension on BuildContext {
  FirebaseAuthManager get _firebaseAuth => FirebaseAuthManager.instance;
  bool get isUserExist => _firebaseAuth.auth.currentUser != null ? true : false;
}
