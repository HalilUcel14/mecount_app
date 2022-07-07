import 'package:account_app/screen/authentication/onboard/view/component/onboard_detail.dart';
import 'package:account_app/screen/authentication/onboard/view/component/onboard_image.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../viewmodel/onboard_viewmodel.dart';

class OnBoardScreen extends BaseStateless {
  OnBoardScreen({Key? key}) : super(key: key);
  //
  late final OnBoardScreenViewModel _viewModel;
  late final BuildContext _context;
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardScreenViewModel>(
      viewModel: OnBoardScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardScreenViewModel viewModel) {
        _viewModel = viewModel;
        _context = context;
        return _scaffold();
      },
    );
  }

  Scaffold _scaffold() => Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                    ResponsivityConstants.instance.mediumScreenSize.toDouble(),
              ),
              child: _pageViewBuilder(),
            ),
          ),
        ),
      );

  Widget _pageViewBuilder() {
    return PageView.builder(
      controller: _viewModel.controller,
      itemCount: _viewModel.onboardList.length,
      itemBuilder: (_context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: OnboardImageCard(
                model: _viewModel.onboardList[index],
              ),
            ),
            Expanded(
              child: OnboardDetailCard(
                viewModel: _viewModel,
                model: _viewModel.onboardList[index],
                length: _viewModel.onboardList.length,
                currentIndex: index,
              ),
            ),
          ],
        );
      },
    );
  }
}
