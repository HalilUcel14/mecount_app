import 'package:flutter/material.dart';

import '../../../../../core/function/size_with_max.dart';

class HomeCompanyListBar extends StatelessWidget {
  const HomeCompanyListBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: infinityWithMaxSize(500),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.red],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: _layoutBuilder(),
    );
  }

  LayoutBuilder _layoutBuilder() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              _rowLabel(constraints),
              SizedBox(height: constraints.maxHeight * 0.1),
              _subLabel(constraints, title: "Owner : ", text: 'Halil Ücel'),
              _subLabel(constraints, title: 'VD No : ', text: '111 222 3344'),
              _subLabel(constraints,
                  title: 'Name  : ',
                  text: 'Ucel Yazılım Yatırım Danışmanlık Tic. Ltd. Şti.'),
            ],
          ),
        );
      },
    );
  }

  Row _subLabel(
    BoxConstraints constraints, {
    String? title,
    String? text,
  }) {
    return Row(
      children: [
        SizedBox(width: constraints.maxWidth * 0.03),
        const Icon(
          Icons.label_important,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(width: constraints.maxWidth * 0.03),
        Text(
          title!,
          style: TextStyle(
            color: Colors.white,
            fontSize: constraints.maxHeight * 0.12,
          ),
        ),
        Expanded(
          child: Text(
            text!,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(
              color: Colors.white,
              fontSize: constraints.maxHeight * 0.12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Row _rowLabel(BoxConstraints constraints) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                blurStyle: BlurStyle.solid,
                color: Colors.transparent,
              ),
            ],
          ),
          child: Text(
            'Ucel Yazılım',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: constraints.maxHeight * 0.2,
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              'Active',
              style: TextStyle(
                color: Colors.white,
                fontSize: constraints.maxHeight * 0.12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Switch(
              value: true,
              onChanged: (bool value) {},
              activeColor: Colors.white,
            ),
          ],
        ),
        SizedBox(width: constraints.maxWidth * 0.05),
      ],
    );
  }
}
