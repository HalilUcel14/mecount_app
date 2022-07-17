import 'package:account_app/core/routes/app_routes.dart';
import 'package:account_app/screen/product/home/view/isweb/home_page_web.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../viewmodel/home_view_model.dart';
import 'ismobile/home_page_mobile.dart';

class HomeScreen extends BaseStateless {
  HomeScreen({Key? key}) : super(key: key);
  //
  late HomeScreenViewModel _viewModel;
  late BuildContext _context;
  //
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
        _context = context;
        //
        return _scaffold();
      },
    );
  }

  Widget _scaffold() {
    return Scaffold(
      body: StreamBuilder<User?>(
        // Kullanıcı Hesaptan Çıkarsa Home Ekranı Kapatma Amaçlıdır.
        stream: _viewModel.authManager.auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return _homePageBuilder();
          } else {
            return _notAuthBuilder(context);
          }
        },
      ),
    );
  }

  Widget _homePageBuilder() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ekran Genişliği 600 den Küçük mü Büyük mü
        if (ResponsivityConstants.instance.mediumScreenSize >=
            constraints.maxWidth) {
          return HomePageIsMobile(
            viewModel: _viewModel,
          );
        } else {
          return HomePageIsWeb(
            viewModel: _viewModel,
          );
        }
      },
    );
  }

  Widget _notAuthBuilder(BuildContext context) {
    return SizedBox(
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
    );
  }
}
