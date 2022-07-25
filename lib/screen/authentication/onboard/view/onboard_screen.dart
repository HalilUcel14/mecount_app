import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../viewmodel/onboard_viewmodel.dart';
import 'component/onboard_detail.dart';
import 'component/onboard_image.dart';

class OnBoardScreen extends BaseStateless {
  OnBoardScreen({Key? key}) : super(key: key);
  //
  late final OnBoardScreenViewModel _viewModel;
  // late final BuildContext _context;
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
        // _context = context;
        return _scaffold();
      },
      onDispose: () {
        _viewModel.controller.dispose();
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
        var currentModel = _viewModel.onboardList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: OnboardImageCard(model: currentModel),
            ),
            Expanded(
              child: OnboardDetailCard(
                model: currentModel,
                currentIndex: index,
                viewModel: _viewModel,
              ),
            ),
          ],
        );
      },
    );
  }
}
