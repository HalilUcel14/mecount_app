import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../viewmodel/home_view_model.dart';
import 'platform/home_mobile.dart';
import 'platform/home_web.dart';

// ignore: must_be_immutable
class HomeScreen extends BaseStateless {
  HomeScreen({Key? key}) : super(key: key);
  //
  late HomeScreenViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenViewModel>(
      viewModel: HomeScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeScreenViewModel viewModel) {
        _viewModel = viewModel;
        return _scaffold(context);
      },
    );
  }

  Widget _scaffold(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Stack(
        children: [
          _homePageBuilder(),
        ],
      ),
    );
  }

  /// Kullanıcı Aktif olması durumunda Açık olunacak ekran
  /// Mevcut Platformun hangisi olduğuna göre ayar yapar.
  Widget _homePageBuilder() {
    return PlatformWidget(
      onMobile: HomeViewMobile(viewModel: _viewModel),
      onDesktopWeb: HomeViewDesktopWeb(viewModel: _viewModel),
    );
  }

  /// Kullanıcı giriş yapıtığı hesap kapanırsa veya kapatılırsa menu ekranından çıkartıp
  /// bu ekrana yönlendirilir. Kullanıcı olmaksızın işlem yapması önleme amacı ile
  ///

}
