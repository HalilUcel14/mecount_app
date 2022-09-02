// ignore_for_file: must_be_immutable

import 'package:account_app/screen/authentication/verifiy/view/components/verify_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../core/widget/default_container_screen_widget.dart';
import '../view_model/verify_viewmodel.dart';
import 'components/verify_logo_and_title.dart';

class VerifyScreen extends BaseStateless {
  VerifyScreen({Key? key}) : super(key: key);
  //
  late VerifyScreenViewModel _viewModel;
  late BuildContext _context;
  //
  @override
  Widget build(BuildContext context) {
    return BaseView<VerifyScreenViewModel>(
      viewModel: VerifyScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, VerifyScreenViewModel viewModel) {
        _viewModel = viewModel;
        _context = context;
        return _scaffold();
      },
    );
  }

  Scaffold _scaffold() => Scaffold(
        body: SafeArea(
          child: DefaultContainerCreateScreen(
            child: Column(
              children: [
                Expanded(
                  child: VerifyLogoAndTitle(viewModel: _viewModel),
                  flex: 2,
                ),
                Expanded(
                  child: VerifyFormField(viewModel: _viewModel),
                  flex: 2,
                ),
                Expanded(
                  child: Container(),
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      );
}
