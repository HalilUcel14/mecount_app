import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widget/platform_widget.dart';
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
        return _scaffold();
      },
    );
  }

  Widget _scaffold() {
    return StreamBuilder<User?>(
      // Kullanıcı Hesaptan Çıkarsa Home Ekranı Kapatma Amaçlıdır.
      stream: _viewModel.authManager.authStateChanges,
      builder: (context, snapshot) {
        // Kullanıcı Var İse
        if (snapshot.data != null) {
          _viewModel.authManager.changeModelSnapshotUser(user: snapshot.data);
          return _homePageBuilder();
        }
        // Kullanıcı Yok İse
        else {
          return _notAuthBuilder(context);
        }
      },
    );
  }

  /// Kullanıcı Aktif olması durumunda Açık olunacak ekran
  /// Mevcut Platformun hangisi olduğuna göre ayar yapar.
  Widget _homePageBuilder() {
    return PlatformWidget(
      mobile: HomeViewMobile(viewModel: _viewModel),
      desktopWeb: HomeViewDesktopWeb(viewModel: _viewModel),
    );
  }

  /// Kullanıcı giriş yapıtığı hesap kapanırsa veya kapatılırsa menu ekranından çıkartıp
  /// bu ekrana yönlendirilir. Kullanıcı olmaksızın işlem yapması önleme amacı ile
  ///
  Widget _notAuthBuilder(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your Login Account is Closed!\nPlease return login page",
            ),
            ElevatedButtonWithStadiumBorder(
              child: const Text('Log In Page'),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.login, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
