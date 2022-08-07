import 'package:account_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../detail/detail_screen.dart';
import '../../viewmodel/home_view_model.dart';

class HomeDrawerLayout extends StatelessWidget {
  HomeDrawerLayout({Key? key}) : super(key: key);

  final HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      semanticLabel: 'Hello',
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context, constraints.maxHeight * 0.20),
              _buildMenuItems(context, constraints.maxHeight * 0.70),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHeader(BuildContext context, double sizeHeight) {
    return Container(
      padding: EdgeInsets.only(top: context.mediaQuery.padding.top),
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
      ),
      child: Column(
        children: [
          SizedBox(height: sizeHeight * 0.1),
          CircleAvatar(
            radius: sizeHeight * 0.40,
            backgroundImage: NetworkImage(''.randomImage),
          ),
          SizedBox(height: sizeHeight * 0.1),
          Text(
            viewModel.authManager.currentUser?.displayName ?? '',
            style: TextStyle(
              fontSize: sizeHeight * 0.2,
              color: Colors.white,
            ),
          ),
          SizedBox(height: sizeHeight * 0.1),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context, double sizeHeight) {
    return Container(
      padding: EdgeInsets.all(sizeHeight * 0.03),
      child: Wrap(
        runSpacing: sizeHeight * 0.01,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Favourites'),
            onTap: () {
              context.push(const DetailScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.workspaces_outline),
            title: const Text('Workflow'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Updates'),
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Colors.black54),
          ),
          ListTile(
            leading: const Icon(Icons.account_tree_outlined),
            title: const Text('Plugins'),
            onTap: () async {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_sharp),
            title: const Text('Sign Out'),
            onTap: () async {
              await context.pushNameAndRemoveUntil(AppRoutes.login);
              viewModel.authManager.signOut();
            },
          ),
        ],
      ),
    );
  }
}
