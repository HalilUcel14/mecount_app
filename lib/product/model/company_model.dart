import 'package:hucel_core/hucel_core.dart';

class CompanyModel extends BaseModel {
  String? name;
  bool? isActive;
  String? ownerUuid;
  String? vdNo;
  String? fullName;
  String? address;
  String? phoneNumber;
  String? mailAddress;
  String? uuid;
  bool? emailVerified;

  CompanyModel({
    this.name,
    this.address,
    this.emailVerified,
    this.fullName,
    this.isActive,
    this.mailAddress,
    this.ownerUuid,
    this.phoneNumber,
    this.uuid,
    this.vdNo,
  });
  CompanyModel.starter({
    required this.name,
    required this.address,
    this.emailVerified = false,
    required this.fullName,
    this.isActive = true,
    required this.mailAddress,
    required this.ownerUuid,
    required this.phoneNumber,
    required this.uuid,
    required this.vdNo,
  });

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
