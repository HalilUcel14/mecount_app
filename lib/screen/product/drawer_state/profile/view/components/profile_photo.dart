import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../../core/routes/app_routes.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    Key? key,
    required this.context,
    required this.constraints,
  }) : super(key: key);

  final BuildContext context;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.home, (route) => false),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ],
          ),
          Center(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(200),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 8),
                  ],
                ),
                child: CircleAvatar(
                  radius: constraints.maxWidth * 0.25,
                  backgroundImage: NetworkImage("".randomImage),
                ),
              ),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.03,
          ),
        ],
      ),
    );
  }
}
