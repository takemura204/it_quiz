import 'package:flutter/material.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:lottie/lottie.dart';

class AnimationImage extends StatefulWidget {
  const AnimationImage({required this.asset});

  final String asset;

  @override
  State<AnimationImage> createState() => _AnimationImageState();
}

class _AnimationImageState extends State<AnimationImage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          context.mainColor.withOpacity(0.7), BlendMode.srcATop),
      child: Lottie.asset(
        widget.asset,
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..repeat(); // ループを開始
        },
      ),
    );
  }
}
