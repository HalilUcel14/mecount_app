import 'package:hucel_core/hucel_core.dart';

class CompanyModel extends BaseModel {
  String? name;
  bool? isActive;
  String? owner;
  String? vdNo;
  String? fullName;
  String? address;
  String? phoneNumber;
  String? mailAddress;
  String? uuid;

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
