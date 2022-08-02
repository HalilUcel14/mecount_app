import 'package:hucel_core/hucel_core.dart';

import 'authority_model.dart';

class MainGroup extends BaseModel<MainGroup> {
  //
  AuthorityModel? accountant;
  AuthorityModel? humanResource;
  AuthorityModel? lawDepartment;
  AuthorityModel? chancelery;

  @override
  fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  MainGroup({
    this.accountant,
    this.humanResource,
    this.chancelery,
    this.lawDepartment,
  });

  static MainGroup onlyRead = MainGroup(
    accountant: AuthorityModel.onlyRead(),
    chancelery: AuthorityModel.onlyRead(),
    humanResource: AuthorityModel.onlyRead(),
    lawDepartment: AuthorityModel.onlyRead(),
  );
  //
  static MainGroup notDelete = MainGroup(
    accountant: AuthorityModel.notDelete(),
    chancelery: AuthorityModel.notDelete(),
    humanResource: AuthorityModel.notDelete(),
    lawDepartment: AuthorityModel.notDelete(),
  );
  //
  static MainGroup all = MainGroup(
    accountant: AuthorityModel.all(),
    chancelery: AuthorityModel.all(),
    humanResource: AuthorityModel.all(),
    lawDepartment: AuthorityModel.all(),
  );
}
