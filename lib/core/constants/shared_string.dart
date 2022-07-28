class SharedConstants {
  static SharedConstants? _instance;
  static SharedConstants get instance {
    _instance ??= SharedConstants._init();
    return _instance!;
  }

  SharedConstants._init();

  String onboardFirstShowed = 'Onboard Showed';
}
