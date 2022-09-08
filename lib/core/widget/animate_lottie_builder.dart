import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedLottieAssetBuilder extends StatefulWidget {
  const AnimatedLottieAssetBuilder({
    Key? key,
    required this.iconPath,
    this.controller,
    this.animate = true,
    this.frameRate,
    this.repeat,
    this.reverse,
    this.delegates,
    this.options,
    this.onLoaded,
    this.imageProviderFactory,
    this.bundle,
    this.frameBuilder,
    this.errorBuilder,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment,
    this.package,
    this.addRepaintBoundary,
    this.filterQuality,
    this.onWarning,
  }) : super(key: key);

  final String iconPath;

  final Animation<double>? controller;
  final bool? animate;
  final FrameRate? frameRate;
  final bool? repeat;
  final bool? reverse;
  final LottieDelegates? delegates;
  final LottieOptions? options;
  final void Function(LottieComposition)? onLoaded;
  final ImageProvider<Object>? Function(LottieImageAsset)? imageProviderFactory;
  final AssetBundle? bundle;
  final Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final String? package;
  final bool? addRepaintBoundary;
  final FilterQuality? filterQuality;
  final void Function(String)? onWarning;

  @override
  State<AnimatedLottieAssetBuilder> createState() =>
      _AnimatedLottieAssetBuilderState();
}

class _AnimatedLottieAssetBuilderState extends State<AnimatedLottieAssetBuilder>
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
    return LayoutBuilder(builder: (context, constraints) {
      return Lottie.asset(
        widget.iconPath,
        fit: widget.fit,
        // default olarak true gelir animasyon durdurma oynatma,
        height: widget.height ?? constraints.maxHeight,
        width: widget.width ?? constraints.maxWidth,

        animate: widget.animate,
        onLoaded: widget.onLoaded ??
            (composition) {
              lottieController.duration = composition.duration;
              lottieController.forward();
            },
        addRepaintBoundary: widget.addRepaintBoundary,
        alignment: widget.alignment,
        bundle: widget.bundle,
        controller: widget.controller,
        delegates: widget.delegates,
        errorBuilder: widget.errorBuilder,
        filterQuality: widget.filterQuality,
        frameBuilder: widget.frameBuilder,
        frameRate: widget.frameRate,
        imageProviderFactory: widget.imageProviderFactory,
        onWarning: widget.onWarning,
        options: widget.options,
        package: widget.package,
        repeat: widget.repeat,
        reverse: widget.reverse,
      );
    });
  }
}
