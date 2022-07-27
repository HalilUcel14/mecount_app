// ignore_for_file: avoid_print

import 'package:account_app/product/model/firebase_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

abstract class IFirebaseAuthManager {
  late FirebaseAuth auth;
  late UserCredential? credential;
  User? get currentUser;
  late String? loginText;
  late FirebaseUserModel userModel;
  Stream<User?> get authStateChanges;

  createUserWithEmailAndPassword({String? email, String? pass});
  signInWithEmailAndPassword({String? email, String? pass});
  changeModelUser({FirebaseUserModel? model});
}

class FirebaseAuthManager implements IFirebaseAuthManager {
  static FirebaseAuthManager? _instance;
  //
  static FirebaseAuthManager get instance {
    _instance ??= FirebaseAuthManager._init();
    return _instance!;
  }

  FirebaseAuthManager._init();

  ///
  // -------------------------> Override <-------------------------
  ///

  /// For Firebase auth İnstanse
  @override
  FirebaseAuth auth = FirebaseAuth.instance;

  @override

  /// Firebase auth sonrası oluşan credential içindeki değerleri
  /// kullanmak değiştirmek kontrol etmek amaçlıdır.
  FirebaseUserModel userModel = FirebaseUserModel.empty();
  @override

  /// Auth için herhangi hata oluşması sonucu
  /// buraya düşen değeri okutabilirsiniz.
  late String? loginText;
  @override

  /// crendetial için işlem yapmak isterseniz.
  late UserCredential? credential;
  @override

  /// auth için durum değişmeleri yakalanır.
  Stream<User?> get authStateChanges => auth.authStateChanges();
  @override

  /// user için doğrudan erişim
  /// user modelden erişmek daha doğrusu olacaktır.
  User? get currentUser => auth.currentUser;

  ///
  // -------------------------> Function <-------------------------
  ///

  /// User Change
  @override
  changeModelUser({FirebaseUserModel? model}) => userModel = model!;

  changeModelSnapshotUser({required User? user}) {
    var dataModel = FirebaseUserModel(
      email: user!.email!,
      password: '',
      displayName: user.displayName,
      emailVerified: user.emailVerified,
      hashCod: user.hashCode,
      isAnonymous: user.isAnonymous,
      phoneNumber: user.phoneNumber,
      photoUrl: user.photoURL,
      refreshToken: user.refreshToken,
      uuid: user.uid,
    );
    userModel = dataModel;
  }

  ///
  // -------------------------> Sign In-Out <-------------------------
  ///
  @override
  createUserWithEmailAndPassword({
    String? email,
    String? pass,
  }) async {
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: email!,
        password: pass!,
      );
      loginText = 'User Create is Successfully';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        loginText = 'The password provided is too weak.';
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        loginText = 'The account already exists for that email.';
        print('The account already exists for that email.');
      }
    } catch (e) {
      loginText = e.toString();
      print(e.toString());
    }
  }

  @override
  signInWithEmailAndPassword({
    String? email,
    String? pass,
  }) async {
    try {
      credential = await auth.signInWithEmailAndPassword(
        email: email!,
        password: pass!,
      );
      loginText = 'Is Login Successfull';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        loginText = 'No user found for that email.';
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        loginText = 'Wrong password provided for that user.';
        print('Wrong password provided for that user.');
      }
    }
  }

  //Future<UserCredential>
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    credential = await auth.signInWithCredential(googleCredential);
  }

  signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    credential = await auth.signInWithCredential(facebookAuthCredential);
  }

  signInWithTwitter() async {
    // Create a TwitterLogin instance
    final twitterLogin = TwitterLogin(
        apiKey: '<your consumer key>',
        apiSecretKey: ' <your consumer secret>',
        redirectURI: '<your_scheme>://');

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    // Once signed in, return the UserCredential
    credential = await auth.signInWithCredential(twitterAuthCredential);
  }

  getAnonymousCredential() async {
    credential = await auth.signInAnonymously();
  }

  signOuth() async {
    await auth.signOut();
  }

  bool get getAuthStateChange {
    late bool isUser;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        isUser = false;
        print('User is currently signed out!');
      } else {
        isUser = true;
        print('User is signed in!');
      }
    });
    return isUser;
  }

  idTokenChanges() {
    auth.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  bool isUserActive() {
    bool isUser = false;
    auth.userChanges().listen((User? user) {
      if (user != null) {
        isUser = true;
      }
    });
    return isUser;
  }

  verifyUserEmail() async {
    if (auth.currentUser != null && !auth.currentUser!.emailVerified) {
      await auth.currentUser!.sendEmailVerification();
    }
  }

  openLinkInApp() async {
    if (auth.currentUser != null && !auth.currentUser!.emailVerified) {
      var actionCodeSettings = ActionCodeSettings(
        url: 'https://www.example.com/?email=${auth.currentUser!.email}',
        dynamicLinkDomain: 'example.page.link',
        androidPackageName: 'com.example.android',
        androidInstallApp: true,
        androidMinimumVersion: '12',
        iOSBundleId: 'com.example.ios',
        handleCodeInApp: true,
      );

      await auth.currentUser!.sendEmailVerification(actionCodeSettings);
    }
  }

  sendSignInLinkToEmail({required String email}) async {
    var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: 'https://www.example.com/finishSignUp?cartId=1234',
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: 'com.example.ios',
      androidPackageName: 'com.example.android',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '12',
    );
    //
    await auth
        .sendSignInLinkToEmail(
          email: email,
          actionCodeSettings: acs,
        )
        .catchError(
          (onError) => print('Error sending email verification $onError'),
        )
        .then(
          (value) => print('Successfully sent email verification'),
        );
  }

  deleteUser() async {
    try {
      await auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  String? getUserUid() {
    if (auth.currentUser != null) {
      return auth.currentUser!.uid.toString();
    }
    return null;
  }

  reAuthenticatingAUser({required String email, required String pass}) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: pass);
    await auth.currentUser!.reauthenticateWithCredential(credential);
  }
}
