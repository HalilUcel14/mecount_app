// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../model/register_model.dart';
import '../../view_model/register_viewmodel.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({Key? key, required this.viewModel}) : super(key: key);

  final RegisterScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return Column(
          children: [
            ElevatedButtonWithStadiumBorder(
              child: Text(
                viewModel.constant.registerButton,
                style: TextStyle(fontSize: height * 0.075),
              ),
              fixedSize: Size(width * 0.3, height * 0.16),
              onPressed: () async {
                viewModel.formKey.currentState!.save();

                if (viewModel.isNotEmpty()) {
                  if (viewModel.isMatchPass()) {
                    if (!viewModel.emailText.isValidEmail) {
                      print('Not Valid your Email');
                    } else if (!viewModel.passText.isValidLowPassword) {
                      print('Not Valid Your Password');
                    } else {
                      print('İts Okey');
                      // User Data Cloud Reference
                      var userRef = viewModel.cloudFirestoreManager
                          .getReference(collectionName: 'user');
                      // Kullanıcı oluşturma ve sayfa geçiş
                      await viewModel.authManager
                          .createUserWithEmailAndPassword(
                        email: viewModel.emailText,
                        pass: viewModel.passText,
                      );
                      // Kullanıcıyı sistemde ayrıdan kayıt oluşturma.
                      RegisterModel model = RegisterModel(
                        email: viewModel.emailText,
                        password: viewModel.passText,
                        uuid: viewModel.authManager.credential!.user!.uid,
                        isOnline: true,
                      );

                      // modeli dataya gönderme
                      await viewModel.cloudFirestoreManager
                          .addCollectionData(userRef, model.toJson());
                      print('add Data $model.');
                    }
                  } else {
                    print('İs Not Match Confirm and Password');
                  }
                } else {
                  print('Your TextField is Empty');
                }
              },
            ),
            const Spacer(flex: 5),
            _alreadyHaveAccount(constraints, context),
            const Spacer(),
          ],
        );
      },
    );
  }

  Row _alreadyHaveAccount(BoxConstraints constraints, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          viewModel.constant.haveAccount,
          style: TextStyle(fontSize: constraints.maxHeight * 0.075),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.login, (route) => false);
          },
          child: Text(
            viewModel.constant.logInTextButton,
            style: TextStyle(fontSize: constraints.maxHeight * 0.08),
          ),
        )
      ],
    );
  }

  void registerPressed() async {}
}
