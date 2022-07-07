import 'package:account_app/screen/authentication/onboard/model/onboard_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<OnBoardModel>> fetchDataFromFirebase(
    {required String collectionName}) async {
  List<OnBoardModel> list = [];
  await FirebaseFirestore.instance
      .collection(collectionName)
      .get()
      .then((value) {
    for (var element in value.docs) {
      list.add(OnBoardModel().fromJson(element.data()));
    }
  });
  return list;
}
