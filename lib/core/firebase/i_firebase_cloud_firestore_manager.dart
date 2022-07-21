import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFirebaseCloudFirestoreManager {
  late FirebaseFirestore cloudFirestore;
  CollectionReference reference({required String collectionName});
  addCollectionData(CollectionReference reference, Object? data);
  Future<Map<String, dynamic>> readOneTimeData(
      {required CollectionReference reference, required String docId});
}

class FirebaseCloudFirestoreManager extends IFirebaseCloudFirestoreManager {
  static FirebaseCloudFirestoreManager? _instance;
  static FirebaseCloudFirestoreManager get instance {
    _instance ??= FirebaseCloudFirestoreManager._init();
    return _instance!;
  }

  FirebaseCloudFirestoreManager._init();

  @override
  addCollectionData(CollectionReference<Object?> reference, Object? data) {
    return reference
        .add(data)
        .then((value) => print('add $value'))
        .catchError((error) => print('failure add $error'));
  }

  @override
  CollectionReference<Object?> reference({
    required String collectionName,
  }) {
    return cloudFirestore.collection(collectionName);
  }

  ///
  ///

  @override
  FirebaseFirestore get cloudFirestore => FirebaseFirestore.instance;

  @override
  Future<Map<String, dynamic>> readOneTimeData({
    required CollectionReference reference,
    required String docId,
  }) async {
    late DocumentSnapshot snapshot;
    try {
      snapshot = await reference.doc(docId).get();
    } catch (e) {
      print(e.toString());
    }
    return snapshot.data() as Map<String, dynamic>;
  }

  readRealtimeChangesCollectionData({required CollectionReference reference}) {
    return reference.snapshots();
  }

  readRealtimeChangesDocumentData(
      {required CollectionReference reference, required String docId}) {
    return reference.doc(docId).snapshots();
  }

  Map<String, dynamic> getMaptoQuerySnapshot(
      DocumentSnapshot<Object?> snapshot) {
    return snapshot.data() as Map<String, dynamic>;
  }

  ///
  ///

  ///
}
