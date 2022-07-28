import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/widget/selected_indicator.dart';
import '../../model/onboard_model.dart';
import '../../viewmodel/onboard_viewmodel.dart';

class OnboardDetailCard extends StatelessWidget {
  const OnboardDetailCard({
    Key? key,
    required this.model,
    required this.currentIndex,
    required this.viewModel,
  }) : super(key: key);

  final OnBoardModel model;
  final int currentIndex;
  final OnBoardScreenViewModel viewModel;
  //
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: context.padAllS,
          margin: context.padAllS,
          child: _childColumn(context, constraints),
          decoration: detailCard(constraints),
        );
      },
    );
  }

  BoxDecoration detailCard(BoxConstraints constraints) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(constraints.maxHeight * 0.1),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: constraints.maxHeight * 0.05,
            color: Colors.grey,
            blurStyle: BlurStyle.solid,
          ),
        ],
      );

  Widget _childColumn(BuildContext context, BoxConstraints constraints) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _titleAndSubTitle(context, constraints),
        _selectedIndicator(context, constraints),
        _nextPreviousButton(context, constraints),
      ],
    );
  }

  MySelectedIndicator _selectedIndicator(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    return MySelectedIndicator(
      length: viewModel.onboardList.length,
      currentIndex: currentIndex,
      selectedSize: constraints.maxHeight * 0.05,
      unSelectedSize: constraints.maxHeight * 0.025,
      unSelectedColor: Colors.grey,
    );
  }

  Row _nextPreviousButton(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    return Row(
      children: [
        const Spacer(),
        _onboardElevationButton(
          context,
          constraints,
          text: viewModel.constants.previous,
          onPressed: () {
            viewModel.controller.previousPage(
              duration: context.durationS,
              curve: Curves.easeInCirc,
            );
          },
        ),
        const Spacer(),
        _onboardElevationButton(
          context,
          constraints,
          text: viewModel.constants.next,
          onPressed: () {
            viewModel.controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
            );
          },
        ),
        const Spacer(),
      ],
    );
  }

  ElevatedButtonWithStadiumBorder _onboardElevationButton(
    BuildContext context,
    BoxConstraints constraints, {
    required String text,
    required void Function()? onPressed,
  }) {
    return ElevatedButtonWithStadiumBorder(
      child: Text(
        text,
        style: TextStyle(fontSize: constraints.maxHeight * 0.05),
      ),
      onPressed: onPressed,
      styleBackgroundColor: Colors.red,
      fixedSize: Size(
        constraints.maxWidth * 0.3,
        constraints.maxHeight * 0.12,
      ),
    );
  }

  Wrap _titleAndSubTitle(BuildContext context, BoxConstraints constraints) {
    return Wrap(
      children: [
        Center(
          child: Text(
            model.title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: constraints.maxHeight * 0.1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.15),
        Center(
          child: Text(
            model.subTitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: constraints.maxHeight * 0.05,
            ),
          ),
        ),
      ],
    );
  }
}
