import '../firebase/i_firebase_cloud_firestore_manager.dart';

class CloudFirestoreConstant {
  static CloudFirestoreConstant? _instance;
  static CloudFirestoreConstant get instance {
    _instance ??= CloudFirestoreConstant._init();
    return _instance!;
  }

  CloudFirestoreConstant._init();

  static FirebaseCloudFirestoreManager cloudFirestoreManager =
      FirebaseCloudFirestoreManager.instance;
  static String user = 'user';

  // Referansları buraya at
  // mesela user referans dosyası...
  final userReference = cloudFirestoreManager.reference(collectionName: user);
}
