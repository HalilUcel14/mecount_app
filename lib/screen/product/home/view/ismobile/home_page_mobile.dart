import 'package:flutter/material.dart';

import '../../viewmodel/home_view_model.dart';

class HomePageIsMobile extends StatelessWidget {
  const HomePageIsMobile({Key? key, required this.viewModel}) : super(key: key);

  final HomeScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Return İs Mobile"),
    );
  }
}
