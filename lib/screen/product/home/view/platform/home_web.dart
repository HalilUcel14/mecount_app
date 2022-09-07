import 'package:flutter/material.dart';

import '../../viewmodel/home_view_model.dart';
import '../components/home_drawer.dart';

class HomeViewDesktopWeb extends StatelessWidget {
  const HomeViewDesktopWeb({Key? key, required this.viewModel})
      : super(key: key);
  final HomeScreenViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          HomeDrawerLayout(),
        ],
      ),
    );
  }
}
