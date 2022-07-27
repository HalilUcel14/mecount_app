// ignore_for_file: avoid_print

import 'package:account_app/product/model/firebase_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFirebaseCloudFirestoreManager {
  FirebaseFirestore get firestore;

  Future<Map<String, dynamic>> readOneTimeData(
      {required CollectionReference reference, required String docId});
}

enum DataEnum {
  exists,
  notExists,
  error,
}

class FirebaseCloudFirestoreManager extends IFirebaseCloudFirestoreManager {
  static FirebaseCloudFirestoreManager? _instance;
  static FirebaseCloudFirestoreManager get instance {
    _instance ??= FirebaseCloudFirestoreManager._init();
    return _instance!;
  }

  FirebaseCloudFirestoreManager._init();

  @override
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  /// read data
  Future<DocumentSnapshot> oneTimeReadData(
      {required String collection, required String documentId}) {
    CollectionReference users = firestore.collection(collection);

    return users.doc(documentId).get().then((value) => value);
  }

  Future<DataEnum> getDataIsExists(
      {required String collection, required String documentId}) {
    CollectionReference collectionReference = firestore.collection(collection);
    return collectionReference
        .doc(documentId)
        .get()
        .then<DataEnum>((DocumentSnapshot snapshot) {
          if (snapshot.exists) {
            return DataEnum.exists;
          } else {
            return DataEnum.notExists;
          }
        })
        .onError((error, stackTrace) => DataEnum.error)
        .catchError((error) => DataEnum.error);
  }

  realTimeReadCollectionData({required String collection}) {
    CollectionReference users = firestore.collection(collection);
    return users.snapshots();
  }

  realTimeReatDocumentData(
      {required String collection, required String documentId}) {
    CollectionReference users = firestore.collection(collection);
    users.doc(documentId).snapshots();
  }

  addCollectionData(reference, Object? data) {
    return firestore.runTransaction(
      (transaction) async {
        return reference
            .add(data)
            .then((value) => print('add Data'))
            .catchError((error) => print('failure add $error'));
      },
    );
  }

  /// Kayıtlı User için data oluşturma.
  createFirebaseUserData({
    required String collectionPath,
    required FirebaseUserModel model,
  }) {
    final collection = firestore.collection(collectionPath).doc();
    model.documentId = collection.id;
    collection.set(model.toJson());
  }

  @override
  getReference({
    required String collectionName,
    String? documentId,
  }) {
    return documentId == null
        ? firestore.collection(collectionName)
        : firestore.collection(collectionName).doc(documentId);
  }

  ///
  ///

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
