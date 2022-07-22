import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../product/model/company_model.dart';
import '../../viewmodel/home_view_model.dart';
import '../home_constants.dart';
import 'home_company_list.dart';

class HomeViewPage extends StatelessWidget {
  HomeViewPage({Key? key}) : super(key: key);
  //
  final HomeScreenViewModel viewModel = HomeScreenViewModel();
  final HomeConstants constants = HomeConstants.instance;
  //
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return PageView.builder(
          itemCount: defaultCompanyModelList.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child:
                        HomeCompanyList(model: defaultCompanyModelList[index]),
                    height: constrains.maxHeight * 0.4,
                  ),
                  _employeeList(constrains),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Container _employeeList(BoxConstraints constraints) {
    // Ana Alan İçin Container
    return Container(
      height: constraints.maxHeight * 0.75,
      margin: const EdgeInsets.only(top: 12.0),
      padding: EdgeInsets.symmetric(
        vertical: constraints.maxHeight * 0.05,
        horizontal: constraints.maxHeight * 0.03,
      ),
      decoration: _defaultDecoration(constraints),
      // İçerisine Sütun Yapısı
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Employee',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ElevatedButtonWithStadiumBorder(
                  child: const Text('Ekle'), onPressed: () {})
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          //Employee List

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const TestPerson();
              },
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _defaultDecoration(BoxConstraints constrains) {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: _circular(constrains), topRight: _circular(constrains)),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          blurRadius: 20,
          blurStyle: BlurStyle.solid,
          color: Colors.grey,
        ),
      ],
    );
  }

  Radius _circular(BoxConstraints constrains) =>
      Radius.circular(constrains.maxHeight * 0.075);
}

class TestPerson extends StatefulWidget {
  const TestPerson({Key? key}) : super(key: key);

  @override
  State<TestPerson> createState() => _TestPersonState();
}

class _TestPersonState extends State<TestPerson> {
  bool isTab = false;

  void changeTab() {
    setState(() {
      isTab = true;
      print(isTab);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            backgroundImage: NetworkImage(''.randomImage),
            radius: 30,
          ),
          title: const Text('Muhammed Ücel'),
          subtitle: const Text('Muhasebe Sorumlu Yardımcısı'),
          trailing: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              changeTab();
            },
          ),
        ),
        SizedBox(
          height: isTab ? 60 : 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.update),
              Icon(Icons.delete),
              Icon(Icons.message),
            ],
          ),
        ),
      ],
    );
  }
}
