import 'package:flutter/material.dart';

import '../../viewmodel/home_view_model.dart';
import '../components/home_appbar.dart';
import '../components/home_drawer.dart';
import '../components/home_page.dart';

class HomeViewDesktopWeb extends StatelessWidget {
  const HomeViewDesktopWeb({Key? key, required this.viewModel})
      : super(key: key);
  final HomeScreenViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeViewAppBar(viewModel: viewModel),
      drawer: HomeDrawerLayout(viewModel: viewModel),
      body: HomeViewPage(viewModel: viewModel),
    );
  }
}
