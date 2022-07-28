import 'package:hucel_core/hucel_core.dart';

class RegisterModel extends BaseModel {
  String? email;
  String? password;
  bool? isOnline;
  String? uuid;

  RegisterModel({this.email, this.isOnline, this.password, this.uuid});

  @override
  fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      password: json['password'],
      isOnline: json['isOnline'],
      uuid: json['uuid'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'isOnline': isOnline,
      'uuid': uuid,
    };
  }
}
