import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension LottieAssetExtension on String {
  String get getLottie => 'assets/lottie/${this}.json';
}

extension FirebaseUserExtension on BuildContext {
  bool get isUserNull => watch<User?>() == null ? true : false;
}
