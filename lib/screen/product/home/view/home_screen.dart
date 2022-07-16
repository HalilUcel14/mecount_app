import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../authentication/login/view/login_screen.dart';
import '../viewmodel/home_view_model.dart';

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
    return StreamBuilder<User?>(
      stream: _viewModel.authManager.auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return _layoutBuilder();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  Widget _layoutBuilder() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ResponsivityConstants.instance.mediumScreenSize >=
            constraints.maxWidth) {
          return Scaffold(
            drawer: _DefaultDrawer(constraints),
            appBar: _defaultAppBar(),
            body: Column(
              children: const [],
            ),
          );
        } else {
          return Scaffold(
            appBar: _defaultAppBar(),
            body: Row(
              children: [
                _DefaultDrawer(constraints),
                Column(
                  children: const [],
                ),
              ],
            ),
          );
        }
      },
    );
  }

  AppBar _defaultAppBar() {
    return AppBar(
      actions: const [],
      title:
          Text(_viewModel.authManager.auth.currentUser!.displayName ?? "Hello"),
    );
  }

  Container _DefaultDrawer(BoxConstraints constraints) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        width: 250,
        height: constraints.maxHeight,
        child: Column(
          children: const [],
        ));
  }
}
