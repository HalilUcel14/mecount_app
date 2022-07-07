import 'package:account_app/screen/authentication/onboard/model/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:hucel_core/hucel_core.dart';
part 'onboard_viewmodel.g.dart';

class OnBoardScreenViewModel = _OnBoardScreenViewModelBase
    with _$OnBoardScreenViewModel;

abstract class _OnBoardScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() async {
    //   onboardList =
    //     await fetchDataFromFirebase(collectionName: onboardCollectionName);
    //await getDataFromFirebase();
  }

  //

  String onboardCollectionName = 'onboard';
  //
  @observable
  PageController controller = PageController();

  @observable
  List<OnBoardModel> onboardList = [
    OnBoardModel.emptyUuid(
      imgUrl: "assets/onboard/onboard_1.png",
      title: "Sayfa 1",
      subTitle:
          "Sayfa için test edilen ekran, bu ekran deneme amaçlı yaratılan otomasyon görüntüdür.",
    ),
    OnBoardModel.emptyUuid(
      imgUrl: "assets/onboard/onboard_2.png",
      title: "Sayfa 2",
      subTitle:
          "Sayfa için test edilen ekran, bu ekran deneme amaçlı yaratılan otomasyon görüntüdür.",
    ),
    OnBoardModel.emptyUuid(
      imgUrl: "assets/onboard/onboard_3.png",
      title: "Sayfa 3",
      subTitle:
          "Sayfa için test edilen ekran, bu ekran deneme amaçlı yaratılan otomasyon görüntüdür.",
    )
  ];
}
