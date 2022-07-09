import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hucel_core/hucel_core.dart';

import '../viewmodel/login_view_model.dart';

class LoginScreen extends BaseStateless {
  LoginScreen({Key? key}) : super(key: key);
  late LoginScreenViewModel _viewModel;
  late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginScreenViewModel>(
      viewModel: LoginScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginScreenViewModel viewModel) {
        _viewModel = viewModel;
        _context = context;
        return _scaffold();
      },
    );
  }

  Scaffold _scaffold() => Scaffold(
        body: SafeArea(
          child: Container(
            padding: _context.padAllN,
            constraints: BoxConstraints(
              maxWidth:
                  ResponsivityConstants.instance.mediumScreenSize.toDouble(),
            ),
            child: Column(
              children: [
                Expanded(child: Container()),
                Expanded(
                  child: _expandedFormField(),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      );

  Column _expandedFormField() {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    left: 100,
                  ),
                  labelText: 'Username',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: _outlinedBorder(),
                  disabledBorder: _outlinedBorder(),
                  enabledBorder: _outlinedBorder(),
                  focusedBorder: _outlinedBorder(),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 16,
                    blurStyle: BlurStyle.solid,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              width: 80,
              child: Padding(
                padding: _context.padAllN,
                child: SvgPicture.asset(
                  'user_two'.getSvgIcon,
                  color: Colors.black87,
                ),
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    blurStyle: BlurStyle.solid,
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          ],
        ),
        TextFormField(),
        TextFormField(),
      ],
    );
  }

  OutlineInputBorder _outlinedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.transparent,
        style: BorderStyle.solid,
        width: 0,
      ),
      gapPadding: 20,
    );
  }
}
