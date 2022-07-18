import 'package:flutter/material.dart';

class HomeDrawerLayout extends StatelessWidget {
  const HomeDrawerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Drawer(
          elevation: 0.0,
          semanticLabel: 'Hello',
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 96,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
