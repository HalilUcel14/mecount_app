import 'package:hucel_core/hucel_core.dart';

class LoginModel extends BaseModel {
  String? email;
  String? password;
  String? displayName;
  bool? emailVerified;
  bool? isAnonymous;
  int? hashCod;
  String? phoneNumber;
  String? photoUrl;
  String? refreshToken;
  String? uuid;

  LoginModel({
    required this.email,
    required this.password,
    this.displayName,
    this.emailVerified,
    this.hashCod,
    this.isAnonymous,
    this.phoneNumber,
    this.photoUrl,
    this.refreshToken,
    this.uuid,
  });

  LoginModel.onlyMailPass({required this.email, required this.password});

  LoginModel.empty({this.email = '', this.password = ''});

  @override
  fromJson(Map<String, dynamic> json) {
    return LoginModel(email: json['email'], password: json['password']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
