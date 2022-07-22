import 'package:hucel_core/hucel_core.dart';

import 'company_model.dart';

class PersonModel extends BaseModel {
  String? uuid;
  String? displayName;
  String? email;
  String? pass;
  int? companyCount;
  List<CompanyModel>? companyList;
  String? photoUrl;
  bool? isWebOnline;
  bool? isMobileOnline;
  String? phoneNumber;
  String? refreshToken;

  PersonModel({
    this.uuid,
    this.displayName,
    this.email,
    this.pass,
    this.photoUrl,
    this.phoneNumber,
    this.refreshToken,
    this.isMobileOnline,
    this.isWebOnline,
    this.companyCount,
    this.companyList,
  });
  PersonModel.starter({
    required this.uuid,
    required this.email,
    required this.pass,
    required this.refreshToken,
    this.displayName,
    this.phoneNumber,
    this.photoUrl,
    this.companyCount = 0,
    this.companyList,
    required this.isMobileOnline,
    required this.isWebOnline,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
