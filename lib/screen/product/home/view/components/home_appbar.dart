import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../viewmodel/home_view_model.dart';
import 'home_bottom_sheet.dart';

class HomeViewAppBar extends AppBar {
  HomeViewAppBar({
    Key? key,
    required HomeScreenViewModel viewModel,
  }) : super(
          key: key,
          title: _AppBarTitle(viewModel: viewModel),
          actions: [
            SettingButton(viewModel: viewModel),
          ],
        );
}

// ignore: unused_element
class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({Key? key, required this.viewModel}) : super(key: key);
  final HomeScreenViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Text(viewModel.authManager.currentUser?.displayName ?? '');
  }
}

class SettingButton extends StatelessWidget {
  const SettingButton({Key? key, required this.viewModel}) : super(key: key);
  final HomeScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: IconButton(
        onPressed: () async {
          showModalBottomSheet(
            context: context,
            builder: (_) => HomeBottomSettingsSheet(viewModel: viewModel),
          );
        },
        icon: SvgPicture.asset(
          'settings'.getSvgIcon,
          color: Colors.white,
        ),
      ),
    );
  }
}
