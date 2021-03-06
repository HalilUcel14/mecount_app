import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../core/function/size_with_max.dart';
import '../../viewmodel/home_view_model.dart';
import '../home_constants.dart';

class HomeViewPage extends StatelessWidget {
  HomeViewPage({Key? key, required this.viewModel}) : super(key: key);
  //
  final HomeScreenViewModel viewModel;
  final HomeConstants constants = HomeConstants.instance;
  //
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return SingleChildScrollView(
        child: Column(
          children: [
            // get companyName
            // StreamBuilder(
            //   stream: ,
            //   builder: (context, snapshot) {},
            // ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: _animatedContainer(context, constrains),
            ),
          ],
        ),
      );
    });
  }

  AnimatedContainer _animatedContainer(
    BuildContext context,
    BoxConstraints constrains,
  ) {
    return AnimatedContainer(
      duration: context.durationM,
      curve: Curves.fastOutSlowIn,
      height: sizeWithMinSize(constrains.maxHeight * 0.35, minSize: 200),
      width: infinityWithMaxSize(500),
      padding: EdgeInsets.all(constrains.maxHeight * 0.03),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black38,
            blurStyle: BlurStyle.solid,
          ),
        ],
        borderRadius: BorderRadius.circular(constrains.maxHeight * 0.05),
        gradient: constants.randomGradient(),
      ),
      child: _containerChild(),
    );
  }

  Widget _containerChild() {
    return LayoutBuilder(builder: (context, constrains) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleText(constrains),
              const Spacer(),
              Column(
                children: [
                  Text(
                    'Active',
                    style: TextStyle(
                      fontSize: constrains.maxHeight * 0.08,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (bool value) {},
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.black,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              TextWithIcon(
                icon: Icons.label_important_outline,
                label: 'Owner',
                text: 'Halil ??cel',
                size: constrains.maxHeight * 0.08,
              ),
              TextWithIcon(
                icon: Icons.label_important_outline,
                label: 'VD No',
                text: '434 005 7101',
                size: constrains.maxHeight * 0.08,
              ),
              TextWithIcon(
                icon: Icons.label_important_outline,
                label: 'Full Name',
                text:
                    'Vak??fbank Spor Kul??b?? Derne??i Sportif ??ktisadi ????letmesi',
                size: constrains.maxHeight * 0.08,
              ),
              TextWithIcon(
                icon: Icons.label_important_outline,
                label: 'Address',
                text: 'SelamiAli Mahallesi Vak??f Sokak No:8',
                size: constrains.maxHeight * 0.08,
              ),
              TextWithIcon(
                icon: Icons.label_important_outline,
                label: 'Phone',
                text: '0216 341 80 13',
                size: constrains.maxHeight * 0.08,
              ),
              TextWithIcon(
                icon: Icons.label_important_outline,
                label: 'Mail',
                text: 'muhasebe@vakifbanksk.com',
                size: constrains.maxHeight * 0.08,
              ),
            ],
          ),
        ],
      );
    });
  }

  Text _titleText(BoxConstraints constrains) {
    return Text(
      'Vak??fbank SK',
      style: TextStyle(
        shadows: [
          BoxShadow(
            color: Colors.black,
            blurRadius: constrains.maxHeight * 0.2,
            blurStyle: BlurStyle.inner,
          ),
        ],
        color: Colors.white,
        fontSize: constrains.maxHeight * 0.18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TextWithIcon extends Padding {
  TextWithIcon({
    Key? key,
    required IconData icon,
    required String label,
    required String text,
    EdgeInsetsGeometry padding = const EdgeInsets.only(left: 8.0),
    double size = 14,
    Color color = Colors.white,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) : super(
          key: key,
          padding: padding,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: mainAxisSize,
            textBaseline: textBaseline,
            textDirection: textDirection,
            verticalDirection: verticalDirection,
            children: [
              Icon(
                icon,
                size: size * 1.2,
                color: color,
              ),
              SizedBox(width: size * 0.4),
              Expanded(
                child: Text(
                  '$label : $text',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: size,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        );
}
