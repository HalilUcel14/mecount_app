import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../../auth/authentication_constants.dart';
import '../model/onboard_model.dart';

part 'onboard_viewmodel.g.dart';

class OnBoardScreenViewModel = _OnBoardScreenViewModelBase
    with _$OnBoardScreenViewModel;

abstract class _OnBoardScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}

  final AuthencticationConstants constants = AuthencticationConstants.instance;
  //
  @observable
  PageController controller = PageController(initialPage: 0);

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
