import 'package:firebase_auth/firebase_auth.dart';

class DefaultFirebaseAuthHelper {
  static DefaultFirebaseAuthHelper? _instance;
  static DefaultFirebaseAuthHelper get instance {
    _instance ??= DefaultFirebaseAuthHelper._init();
    return _instance!;
  }

  DefaultFirebaseAuthHelper._init();

  //
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User? currentUser = auth.currentUser;
  static String? token = currentUser!.refreshToken;
}
