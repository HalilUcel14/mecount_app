import 'package:account_app/screen/authentication/onboard/model/onboard_model.dart';
import 'package:account_app/screen/authentication/onboard/viewmodel/onboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/function/size_with_max.dart';
import '../../../../../core/widget/selected_indicator.dart';
import '../onboard_constants.dart';

class OnboardDetailCard extends StatelessWidget {
  const OnboardDetailCard({
    Key? key,
    required this.model,
    required this.length,
    required this.currentIndex,
    required this.viewModel,
  }) : super(key: key);

  final OnBoardModel model;
  final int length;
  final int currentIndex;
  final OnBoardScreenViewModel viewModel;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padAllS,
      margin: context.padAllS,
      width: double.infinity,
      child: _childColumn(context),
      decoration: OnBoardConstants.instance.detailCard(context),
    );
  }

  Widget _childColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _titleAndSubTitle(context),
        _selectedIndicator(context),
        _nextPreviousButton(context)
      ],
    );
  }

  MySelectedIndicator _selectedIndicator(BuildContext context) {
    return MySelectedIndicator(
      length: length,
      currentIndex: currentIndex,
      selectedSize: shortSizeWithMax(context, value: 0.1, max: 16),
      unSelectedSize: shortSizeWithMax(context, value: 0.1, max: 10),
      unSelectedColor: Colors.grey,
    );
  }

  Row _nextPreviousButton(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        _onboardElevationButton(
          context,
          text: OnBoardConstants.instance.previous,
          onPressed: () {
            viewModel.controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInCirc);
          },
        ),
        const Spacer(),
        _onboardElevationButton(
          context,
          text: OnBoardConstants.instance.next,
          onPressed: () {
            viewModel.controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn);
          },
        ),
        const Spacer(),
      ],
    );
  }

  ElevatedButtonWithStadiumBorder _onboardElevationButton(
    BuildContext context, {
    required String text,
    required void Function()? onPressed,
  }) {
    return ElevatedButtonWithStadiumBorder(
      child: Text(
        text,
        style: OnBoardConstants.instance.previousTextStyle(context),
      ),
      onPressed: onPressed,
      styleBackgroundColor: Colors.red,
      fixedSize: Size(
        shortSizeWithMax(context, value: 0.3, max: 150),
        shortSizeWithMax(context, value: 0.1, max: 60),
      ),
    );
  }

  Wrap _titleAndSubTitle(BuildContext context) {
    return Wrap(
      children: [
        Center(
          child: Text(
            model.title!,
            textAlign: TextAlign.center,
            style: OnBoardConstants.instance.titleStyle(context),
          ),
        ),
        SizedBox(height: shortSizeWithMax(context, value: 0.2, max: 50)),
        Center(
          child: Text(
            model.subTitle!,
            textAlign: TextAlign.center,
            style: OnBoardConstants.instance.subTitleStyle(context),
          ),
        ),
      ],
    );
  }
}
