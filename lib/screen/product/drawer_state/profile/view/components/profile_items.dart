import 'package:flutter/material.dart';

import '../../viewmodel/profile_viewmodel.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({
    Key? key,
    required ProfileScreenViewModel viewModel,
    required this.context,
    required this.constraints,
  })  : _viewModel = viewModel,
        super(key: key);

  final ProfileScreenViewModel _viewModel;
  final BuildContext context;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
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
                                                  .authManager.userModel.uuid)
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
              title: Text(_viewModel.authManager.userModel.email),
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
}
