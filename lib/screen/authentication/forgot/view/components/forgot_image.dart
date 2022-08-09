import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/extension/context_extension.dart';

class ForgotLottieImage extends StatefulWidget {
  const ForgotLottieImage({Key? key}) : super(key: key);

  @override
  State<ForgotLottieImage> createState() => _ForgotLottieImageState();
}

class _ForgotLottieImageState extends State<ForgotLottieImage>
    with TickerProviderStateMixin {
  late AnimationController lottieController;

  @override
  void initState() {
    lottieController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );

    lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        lottieController.reset();
      } else {}
    });
    super.initState();
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'support'.getLottie,

        // default olarak true gelir animasyon durdurma oynatma,
        animate: true,

        onLoaded: (composition) {
          lottieController.duration = composition.duration;
          //lottieController.forward();
        },
      ),
    );
  }
}
