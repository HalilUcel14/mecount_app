import 'package:flutter/material.dart';

import '../../viewmodel/home_view_model.dart';
import '../components/home_appbar.dart';
import '../components/home_drawer.dart';
import '../home_page/home_page.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({Key? key, required this.viewModel}) : super(key: key);

  final HomeScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HomeViewAppBar(viewModel: viewModel),
      drawer: HomeDrawerLayout(),
      body: HomeViewPage(),
    );
  }
}
