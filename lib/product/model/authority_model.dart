import 'package:hucel_core/hucel_core.dart';

class AuthorityModel extends BaseModel {
  bool? read;
  bool? write;
  bool? delete;
  //
  AuthorityModel({
    required this.read,
    required this.write,
    required this.delete,
  });
  AuthorityModel.onlyRead({
    this.read = true,
    this.write = false,
    this.delete = false,
  });
  AuthorityModel.notDelete({
    this.read = true,
    this.write = true,
    this.delete = false,
  });
  AuthorityModel.all({
    this.read = true,
    this.write = true,
    this.delete = true,
  });

  static final authoriytRead = AuthorityModel.onlyRead();

  @override
  fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
