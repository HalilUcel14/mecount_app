import 'package:account_app/screen/product/drawer_state/profile/view/components/profile_items.dart';
import 'package:flutter/material.dart';

import '../../viewmodel/profile_viewmodel.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    Key? key,
    required ProfileScreenViewModel viewModel,
    required this.constraints,
    required this.context,
  })  : _viewModel = viewModel,
        super(key: key);

  final ProfileScreenViewModel _viewModel;
  final BoxConstraints constraints;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxHeight,
      height: constraints.maxHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 8),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProfileItems(
            viewModel: _viewModel, context: context, constraints: constraints),
      ),
    );
  }
}
