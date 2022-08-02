import 'package:hucel_core/hucel_core.dart';

class LoginModel extends BaseModel {
  String? uuid;
  bool? isOnlineMobile;
  bool? isOnlineWeb;

  LoginModel({
    this.uuid,
    this.isOnlineMobile,
    this.isOnlineWeb,
  });

  LoginModel.onlineMobile({
    this.uuid,
    this.isOnlineMobile = true,
    this.isOnlineWeb,
  });

  LoginModel.onlineWeb({
    this.uuid,
    this.isOnlineWeb = true,
    this.isOnlineMobile,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return LoginModel(
      uuid: json['uuid'],
      isOnlineMobile: json['isOnlineMobile'],
      isOnlineWeb: json['isOnlineWeb'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'isOnlineMobile': isOnlineMobile,
      'isOnlineWeb': isOnlineWeb,
    };
  }
}
