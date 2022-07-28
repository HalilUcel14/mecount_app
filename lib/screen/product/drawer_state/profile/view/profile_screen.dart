import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/firebase/i_firebase_auth_manager.dart';
import '../../../../../core/routes/app_routes.dart';
import '../viewmodel/profile_viewmodel.dart';
import 'components/profile_detail.dart';
import 'components/profile_photo.dart';

class ProfileScreen extends BaseStateless {
  ProfileScreen({Key? key}) : super(key: key);
  late ProfileScreenViewModel _viewModel;
  late IFirebaseAuthManager authManager;
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileScreenViewModel>(
      viewModel: ProfileScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ProfileScreenViewModel viewModel) {
        _viewModel = viewModel;
        return _scaffold();
      },
    );
  }

  Widget _scaffold() {
    return StreamBuilder<User?>(
      stream: _viewModel.authManager.auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.data != null) {
          _viewModel.authManager.changeModelSnapshotUser(user: snapshot.data);
          return _profilePage(context);
        } else {
          return _notAuthBuilder(context);
        }
      },
    );
  }

  Widget _profilePage(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
                child: Column(
              children: [
                ProfilePhoto(context: context, constraints: constraints),
                ProfileDetail(
                    viewModel: _viewModel,
                    constraints: constraints,
                    context: context),
              ],
            ));
          },
        )),
      ),
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
