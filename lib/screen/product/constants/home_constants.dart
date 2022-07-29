import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class HomeConstants {
  static HomeConstants? _instance;
  static HomeConstants get instance {
    _instance ??= HomeConstants._init();
    return _instance!;
  }

  HomeConstants._init();

  String isActiveText(bool value) => value ? 'Active' : 'Deactive';

  List<LinearGradient> gradiantList = <LinearGradient>[
    LinearGradient(
      colors: ['d38312'.color, 'a83279'.color],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: ['f12711'.color, 'f5af19'.color],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: ['8a2387'.color, 'e94057'.color, 'f27121'.color],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: ['c94b4b'.color, '4b134f'.color],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: ['ee0979'.color, 'ff6a00'.color],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: ['ff5f6d'.color, 'ffc371'.color],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: ['c02425'.color, 'f0cb35'.color],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];
}
