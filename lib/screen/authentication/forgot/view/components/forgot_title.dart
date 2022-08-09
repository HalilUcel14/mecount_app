import 'package:flutter/src/widgets/framework.dart';

import '../../../../../core/widget/auth/title_subtitle_text.dart';

class ForgotTitleSubTitle extends StatelessWidget {
  const ForgotTitleSubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AuthHeadTitle(
      title: 'Please enter your Email',
      subTitle: 'and we send a mail for you reset password link',
      fontSize: 24,
    );
  }
}
