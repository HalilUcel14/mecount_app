import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EasyLocaleConst {
  static EasyLocaleConst? _instance;
  static EasyLocaleConst get instance {
    _instance ??= EasyLocaleConst._init();
    return _instance!;
  }

  EasyLocaleConst._init();

  Locale trLocale = const Locale('tr', 'TR');
  Locale enLocale = const Locale('en', 'US');
  String localePath = 'assets/lang';
}

class EasyLocaleText {}

extension LocaleExtension on String {
  String get easyLocale => this.tr().toString();
}
