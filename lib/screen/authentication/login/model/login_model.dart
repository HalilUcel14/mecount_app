import 'package:hucel_core/hucel_core.dart';

class LoginModel extends BaseModel {
  String? email;
  String? password;

  LoginModel({required this.email, required this.password});

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
