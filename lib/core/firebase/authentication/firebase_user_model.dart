import 'package:hucel_core/hucel_core.dart';

class FirebaseUserModel extends FireBaseModel {
  @override
  final String? uuid;
  final String email;
  final String? displayName;
  final int? hashCod;
  final String? phoneNumber;
  final String? photoUrl;
  final String? refreshToken;
  bool? isMobileOnline;
  bool? isWebOnline;
  bool? isAnonymous;
  bool? emailVerified;

  FirebaseUserModel({
    required this.email,
    this.displayName,
    this.hashCod,
    this.phoneNumber,
    this.photoUrl,
    this.refreshToken,
    this.uuid,
    this.emailVerified,
    this.isAnonymous,
    this.isWebOnline,
    this.isMobileOnline,
  });

  FirebaseUserModel.empty({
    this.email = '',
    this.uuid,
    this.displayName,
    this.hashCod,
    this.phoneNumber,
    this.photoUrl,
    this.refreshToken,
    this.isMobileOnline,
    this.isWebOnline,
    this.emailVerified,
    this.isAnonymous,
  });

  @override
  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) {
    return FirebaseUserModel(
      email: json['email'],
      uuid: json['uuid'],
      displayName: json['displayName'],
      hashCod: json['hashCod'],
      phoneNumber: json['phoneNumber'],
      photoUrl: json['photoUrl'],
      refreshToken: json['refreshToken'],
      isMobileOnline: json['isMobileOnline'],
      isWebOnline: json['isWebOnline'],
      emailVerified: json['emailVerified'],
      isAnonymous: json['isAnonymous'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'uuid': uuid,
      'displayName': displayName,
      'hashCod': hashCod,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'refreshToken': refreshToken,
      'isMobileOnline': isMobileOnline,
      'isWebOnline': isWebOnline,
      'emailVerified': emailVerified,
      'isAnonymous': isAnonymous,
    };
  }

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
