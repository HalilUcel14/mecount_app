import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

abstract class IFirebaseAuthManager {
  late FirebaseAuth auth;

  createUserWithEmailAndPassword({String? email, String? pass});
  signInWithEmailAndPassword({String? email, String? pass});
}

class FirebaseAuthManager implements IFirebaseAuthManager {
  static FirebaseAuthManager? _instance;
  static FirebaseAuthManager get instance {
    _instance ??= FirebaseAuthManager._init();
    return _instance!;
  }

  FirebaseAuthManager._init();

  @override
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  createUserWithEmailAndPassword({String? email, String? pass}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email!,
        password: pass!,
      );
      return UserCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  signInWithEmailAndPassword({String? email, String? pass}) async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email!, password: pass!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  getAuthStateChange() {
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
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

  userChanges() {
    auth.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future<UserCredential> getAnonymousCredential() {
    return auth.signInAnonymously();
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

  signOuth() async {
    await auth.signOut();
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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithTwitter() async {
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
    return await auth.signInWithCredential(twitterAuthCredential);
  }
}