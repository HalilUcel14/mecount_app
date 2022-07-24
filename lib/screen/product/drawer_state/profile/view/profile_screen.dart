import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/firebase/i_firebase_auth_manager.dart';
import '../../../../../core/routes/app_routes.dart';
import '../viewmodel/profile_viewmodel.dart';

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
          _viewModel.authManager
              .changeModelFromFirebaseUser(model: snapshot.data);
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
                profilePhoto(context, constraints),
                profileDetail(constraints, context),
              ],
            ));
          },
        )),
      ),
    );
  }

//----------------------------profil sayfa detayı---------------------------
  Widget profileDetail(BoxConstraints constraints, BuildContext context) {
    return Container(
      width: constraints.maxHeight,
      height: constraints.maxHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 10),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: profileItems(context, constraints),
      ),
    );
  }
  //----------------------------profil sayfa detayı---------------------------

//----------------------------Profile Items-------------------------------
//------itemlerin bulunduğu yer, buradan profil işlemleri bulunmaktadır---------------------
  Widget profileItems(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        Wrap(
          children: [
            ListTile(
              title: const Text(""),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.edit),
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [Text("Change Company Name")],
                              ),
                              SizedBox(
                                height: constraints.maxHeight / 40,
                              ),
                              Form(
                                key: _viewModel.formKey,
                                child: TextFormField(
                                  controller: _viewModel.companyNameController,
                                  validator: (value) {
                                    if (_viewModel.formKey.currentState!
                                        .validate()) {
                                      _viewModel.formKey.currentState!.save();
                                    }
                                    if (_viewModel.companyNameController.text ==
                                            null &&
                                        _viewModel.companyNameController.text
                                                .characters.length <
                                            6) {
                                      return "Please min. 6 characters";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: constraints.maxHeight / 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Cancel"),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () async {
                                        if (_viewModel.formKey.currentState!
                                            .validate()) {
                                          await _viewModel.firestore
                                              .collection("userdata")
                                              .doc(_viewModel
                                                  .authManager.modelUser.uuid)
                                              .update({
                                            "displayName": _viewModel
                                                .companyNameController.text
                                                .trim(),
                                          }).then((value) =>
                                                  Navigator.pop(context));
                                        }
                                      },
                                      child: const Text("Change Name"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text(_viewModel.authManager.modelUser.email!),
              leading: const Icon(Icons.email),
              trailing: const Icon(Icons.verified),
              onTap: () {
                /*_viewModel.authManager.verifyUserEmail;
                if (_viewModel.authManager.modelUser.emailVerified == true) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white.withOpacity(1),
                        elevation: 0,
                        child: Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: constraints.maxWidth * 0.6,
                        ),
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white.withOpacity(1),
                        elevation: 0,
                        child: Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: constraints.maxWidth * 0.6,
                        ),
                      );
                    },
                  );
                }*/
              },
            ),
            ListTile(
              title: const Text("(545) 978 4461"),
              leading: const Icon(Icons.phone),
              trailing: const Icon(Icons.verified),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Change Password"),
              leading: const Icon(Icons.lock),
              trailing: const Icon(Icons.edit),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(color: Colors.black54),
            ),
            ListTile(
              title: const Text("Safe Exit"),
              leading: const Icon(Icons.arrow_back_ios_new),
              onTap: () {
                _viewModel.authManager.signOuth();
              },
            ),
          ],
        ),
      ],
    );
  }
  //----------------------------Profile Items-------------------------------
//------itemlerin bulunduğu yer, buradan profil işlemleri bulunmaktadır---------------------

//-------------profil fotoğrafının bulunduğu bölüm-----------------------------
  Widget profilePhoto(BuildContext context, BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.home, (route) => false),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ],
          ),
          Center(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(200),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 10),
                  ],
                ),
                child: CircleAvatar(
                  radius: constraints.maxWidth * 0.25,
                  backgroundImage: NetworkImage("".randomImage),
                ),
              ),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.03,
          ),
        ],
      ),
    );
  }
  //-------------profil fotoğrafının bulunduğu bölüm-----------------------------

  /// Kullanıcı giriş yapıtığı hesap kapanırsa veya kapatılırsa menu ekranından çıkartıp
  /// bu ekrana yönlendirilir. Kullanıcı olmaksızın işlem yapması önleme amacı ile
  ///
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
