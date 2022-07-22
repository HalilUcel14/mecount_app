import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../product/model/company_model.dart';
import '../home_constants.dart';

class HomeCompanyList extends StatelessWidget {
  HomeCompanyList({Key? key, required this.model}) : super(key: key);
  //
  final HomeConstants constants = HomeConstants.instance;
  final CompanyModel model;
  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: _companyView(context),
    );
  }

  Widget _companyView(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Dış Konteynır için Dizayn
        return AnimatedContainer(
          duration: context.durationM,
          curve: Curves.elasticInOut,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black38,
                blurStyle: BlurStyle.solid,
              ),
            ],
            borderRadius: BorderRadius.circular(constraints.maxHeight * 0.1),
            gradient: constants.gradiantList.randomListData,
          ),
          padding: EdgeInsets.all(constraints.maxHeight * 0.05),
          child: _companyChild(context, constraints),
        );
      },
    );
  }

  Widget _companyChild(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                model.name!.leftTabSpace,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: TextStyle(
                  fontSize: constraints.maxHeight * 0.12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  constants.isActiveText(model.isActive!),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxHeight * 0.06,
                  ),
                ),
                Switch(
                  value: model.isActive!,
                  onChanged: (bool value) {
                    model.isActive = value;
                  },
                ),
              ],
            ),
          ],
        ),
        const Divider(
          color: Colors.white,
          thickness: 1.5,
        ),
        _iconWithText(constraints, 'Full Name', model.fullName!),
        _iconWithText(constraints, 'Vergi D.No', model.vdNo!),
        _iconWithText(constraints, 'Address', model.address!),
        _iconWithText(constraints, 'E Mail', model.mailAddress!),
        _iconWithText(constraints, 'Phone', model.phoneNumber!),
      ],
    );
  }

  Row _iconWithText(BoxConstraints constraints, String label, String text) {
    return Row(
      children: [
        SizedBox(width: constraints.maxWidth * 0.06),
        Icon(
          Icons.label_important,
          color: Colors.white,
          size: constraints.maxHeight * 0.06,
        ),
        SizedBox(width: constraints.maxWidth * 0.03),
        Expanded(
          child: Text(
            '$label : $text',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                color: Colors.white, fontSize: constraints.maxHeight * 0.07),
          ),
        ),
      ],
    );
  }
}
