import 'package:hucel_core/hucel_core.dart';

class OnBoardModel extends BaseModel {
  String? uuid;
  String? title;
  String? subTitle;
  String? imgUrl;

  OnBoardModel({
    this.uuid,
    this.title,
    this.subTitle,
    this.imgUrl,
  });

  OnBoardModel.emptyUuid({
    this.uuid = "",
    this.imgUrl,
    this.subTitle,
    this.title,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return OnBoardModel(
      uuid: json['uuid'].toString(),
      title: json['title'].toString(),
      subTitle: json['subTitle'].toString(),
      imgUrl: json['imgUrl'].toString(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'title': title,
      'subTitle': subTitle,
      'imgUrl': imgUrl,
    };
  }
}
