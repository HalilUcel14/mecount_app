import 'package:hucel_core/hucel_core.dart';

class FirebaseUserModel extends FireBaseModel {
  @override
  final String? uuid;
  final String email;
  final String? password;
  final String? displayName;
  final int? hashCod;
  final String? phoneNumber;
  final String? photoUrl;
  final String? refreshToken;

  bool? isAnonymous;
  bool? emailVerified;

  FirebaseUserModel({
    required this.email,
    this.password,
    this.displayName,
    this.hashCod,
    this.phoneNumber,
    this.photoUrl,
    this.refreshToken,
    this.uuid,
    this.emailVerified,
    this.isAnonymous,
  });

  FirebaseUserModel.empty({
    this.email = '',
    this.password,
    this.uuid,
    this.displayName,
    this.hashCod,
    this.phoneNumber,
    this.photoUrl,
    this.refreshToken,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return FirebaseUserModel(
      email: json['email'],
      displayName: json['displayName'],
      emailVerified: json['emailVerified'],
      hashCod: json['hashCod'],
      isAnonymous: json['isAnonymous'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      photoUrl: json['photoUrl'],
      refreshToken: json['refreshToken'],
      uuid: json['uuid'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'uuid': uuid,
      'displayName': displayName,
      'hashCod': hashCod,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'refreshToken': refreshToken,
      'emailVerified': emailVerified,
      'isAnonymous': isAnonymous,
    };
  }
}
