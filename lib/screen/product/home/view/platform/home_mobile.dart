import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../core/function/size_with_max.dart';
import '../../viewmodel/home_view_model.dart';
import '../components/home_drawer.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({Key? key, required this.viewModel}) : super(key: key);

  final HomeScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.authManager.modelUser.displayName ?? ""),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                viewModel.changeOpenBottomSheet();
              },
            ),
          ),
        ],
      ),
      drawer: const HomeDrawerLayout(),
      bottomSheet: _bottomSheetSettings(),
    );
  }

  Observer _bottomSheetSettings() {
    return Observer(
      name: 'Container Observer',
      builder: (context) => Container(
        width: infinityWithMaxSize(500),
        height: viewModel.isOpenBottomSheet ? context.height / 2 : 0,
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: LayoutBuilder(
          builder: (context, constrains) {
            return _gridView(constrains);
          },
        ),
        decoration: BoxDecoration(
          color: viewModel.isLightMode ? Colors.grey : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 30,
              blurStyle: BlurStyle.solid,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GridView _gridView(BoxConstraints constrains) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      children: [
        _defaultIcon(
          constrains,
          iconName: viewModel.isLightMode ? 'theme-dark' : 'theme-light',
          title: viewModel.isLightMode ? 'Dark Theme' : 'Light Theme',
          pressed: viewModel.changeThemeMode,
        ),
        _defaultIcon(
          constrains,
          iconName: 'translate',
          title: viewModel.isLightMode ? 'Turkish' : 'English',
          pressed: viewModel.changeThemeMode,
        ),
        _defaultIcon(
          constrains,
          iconName: viewModel.isLightMode ? 'theme-dark' : 'theme-light',
          title: viewModel.isLightMode ? 'Dark Theme' : 'Light Theme',
          pressed: viewModel.changeThemeMode,
        ),
      ],
    );
  }

  Widget _defaultIcon(BoxConstraints constrains,
      {required String title,
      required String iconName,
      required Function()? pressed}) {
    return GestureDetector(
      onTap: pressed,
      child: Observer(builder: (context) {
        return Container(
          padding: EdgeInsets.all(constrains.maxHeight * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(constrains.maxHeight * 0.04),
            border: Border.all(
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            children: [
              AnimatedContainer(
                duration: context.durationS,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  iconName.getSvgIcon,
                  height: constrains.maxHeight * 0.2,
                ),
              ),
              SizedBox(height: constrains.maxHeight * 0.03),
              Text(
                title,
                style: TextStyle(
                  fontSize: constrains.maxHeight * 0.045,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _logo(String title, IconData first, IconData second) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: viewModel.isLightMode ? Colors.yellow : Colors.black,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              viewModel.isLightMode ? first : second,
              color: viewModel.isLightMode ? Colors.yellow : Colors.black,
              size: 36,
            ),
            onPressed: viewModel.changeThemeMode,
          )
        ],
      ),
    );
  }
}
