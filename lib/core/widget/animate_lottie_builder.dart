import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedLottieBuilder extends StatefulWidget {
  const AnimatedLottieBuilder({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final String icon;

  @override
  State<AnimatedLottieBuilder> createState() => _AnimatedLottieBuilderState();
}

class _AnimatedLottieBuilderState extends State<AnimatedLottieBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieController;

  @override
  void initState() {
    lottieController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 4,
      ),
    );

    lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        // Navigator.pop(context); // Animasyon Tamamlanınca Sayfayı Kapatır.
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
        widget.icon,
        fit: BoxFit.cover,
        // default olarak true gelir animasyon durdurma oynatma,
        animate: true,
        onLoaded: (composition) {
          lottieController.duration = composition.duration;
          lottieController.forward();
        },
      ),
    );
  }
}
