import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/function/size_with_max.dart';
import '../../../../../core/widget/selected_indicator.dart';

class OnboardDetailCard extends StatelessWidget {
  const OnboardDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padAllS,
      margin: context.padAllS,
      width: double.infinity,
      child: _childColumn(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            shortSizeWithMax(context, value: 0.2, max: 36),
          ),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Colors.grey,
            blurStyle: BlurStyle.solid,
          ),
        ],
      ),
    );
  }

  Widget _childColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _titleAndSubTitle(context),
              MySelectedIndicator(
                length: 3,
                currentIndex: 2,
                unSelectedColor: Colors.grey,
              ),
              _nextPreviousButton(context)
            ],
          ),
        ),
        //
        // 2. Expanded
        //
        // Expanded(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: const [],
        //   ),
        // ),
      ],
    );
  }

  Row _nextPreviousButton(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        ElevatedButtonWithStadiumBorder(
          child: const Text("Previous"),
          onPressed: () {},
          fixedSize: Size(
            shortSizeWithMax(context, value: 0.3, max: 150),
            shortSizeWithMax(context, value: 0.1, max: 60),
          ),
        ),
        const Spacer(),
        ElevatedButtonWithStadiumBorder(
          child: const Text("Next"),
          onPressed: () {},
          fixedSize: Size(
            shortSizeWithMax(context, value: 0.3, max: 150),
            shortSizeWithMax(context, value: 0.1, max: 60),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Wrap _titleAndSubTitle(BuildContext context) {
    return Wrap(
      children: [
        Center(
          child: Text(
            "Search a Flight",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: shortSizeWithMax(context, value: 0.1, max: 36),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: shortSizeWithMax(context, value: 0.02, max: 20)),
        Text(
          "   Up to a certain time, with the exception of skills seems to be suitable for The Software Intended Consequence",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: shortSizeWithMax(context, value: 0.05, max: 18),
          ),
        ),
      ],
    );
  }
}
