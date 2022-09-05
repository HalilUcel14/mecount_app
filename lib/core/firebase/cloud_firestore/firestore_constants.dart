class CloudFirestoreConstants {
  static CloudFirestoreConstants? _instance;
  static CloudFirestoreConstants get instance {
    _instance ??= CloudFirestoreConstants._init();
    return _instance!;
  }

  CloudFirestoreConstants._init();

  String userData = 'user_authentication_data';
}
