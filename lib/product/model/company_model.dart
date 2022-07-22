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
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

List<CompanyModel> defaultCompanyModelList = [
  CompanyModel.starter(
    name: 'Vakıfbank SK',
    address: 'Selami Ali Mah. Vakıf Sok. No:8',
    fullName: 'Vakıfbank Spor Kulübü Derneği',
    mailAddress: 'muhasebe@vakifbanksk.com',
    ownerUuid: 'aaa',
    phoneNumber: '0216 341 80 13',
    uuid: 'bbb',
    vdNo: '434 005 71 01',
  ),
  CompanyModel.starter(
    name: 'Vakıfbank Sportif',
    address: 'Selami Ali Mah. Vakıf Sok. No:8',
    fullName:
        'Vakıfbank Spor Kulübü Derneği Sportif Faaliyetler İktisadi İşletmesi',
    mailAddress: 'info@vakifbanksk.com',
    ownerUuid: 'aaa',
    phoneNumber: '0216 341 80 13',
    uuid: 'bbb',
    vdNo: '883 044 75 94',
  ),
];
