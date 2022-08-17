// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

import 'firebase_user_model.dart';

abstract class IFirebaseAuthManager {
  late FirebaseAuth auth;
  User? get currentUser;
  late FirebaseUserModel model;
  Stream<User?> get authState;
  late String loginCatchError;

  createUserWithEmailAndPassword({String? email, String? password});
  signInWithEmailAndPassword({String email, String password});
}

extension FirebaseAuthManagerExtension on BuildContext {
  FirebaseAuthManager get authManager => FirebaseAuthManager.instance;
}

class FirebaseAuthManagerException implements Exception {
  final String? message;
  FirebaseAuthManagerException({this.message});

  @override
  String toString() {
    return 'Authentication Manager Exception $message';
  }
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
  late FirebaseAuth auth = FirebaseAuth.instance;

  /// auth için durum değişmeleri yakalanır.
  @override
  Stream<User?> get authState => auth.authStateChanges();

  @override
  late String loginCatchError;

  @override
  late FirebaseUserModel model = FirebaseUserModel.empty();

  /// user için doğrudan erişim
  /// user modelden erişmek daha doğrusu olacaktır.
  @override
  User? get currentUser => auth.currentUser;

  ///
  // -------------------------> Sign In-Out <-------------------------
  ///
  @override
  createUserWithEmailAndPassword({String? email, String? password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      loginCatchError = 'User Create is Successfully';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        loginCatchError = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        loginCatchError = 'The account already exists for that email.';
      }
    } catch (e) {
      loginCatchError = e.toString();
    }
    //notifyListeners();
  }

  @override
  signInWithEmailAndPassword({String? email, String? password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      loginCatchError = 'Is Login Successfull';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        loginCatchError = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        loginCatchError = 'Wrong password provided for that user.';
      }
    } catch (e) {
      loginCatchError = e.toString();
    }
    //notifyListeners();
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
    await auth.signInWithCredential(googleCredential);
  }

  signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    await auth.signInWithCredential(facebookAuthCredential);
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
    await auth.signInWithCredential(twitterAuthCredential);
  }

  getAnonymousCredential() async {
    await auth.signInAnonymously();
  }

  signOut() async {
    await auth.signOut();
  }

  sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'auth/invalid-email':
          loginCatchError = 'Email Address is not Valid';
          break;
        case 'auth/missing-android-pkg-name':
          loginCatchError = 'Android app is required to be installed.';
          break;
        case 'auth/user-not-found':
          loginCatchError = 'User Email is Not Found';
          break;
      }
    }
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
