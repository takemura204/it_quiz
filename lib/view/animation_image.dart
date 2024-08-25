import 'package:flutter/material.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:lottie/lottie.dart';

class AnimationImage extends StatefulWidget {
  const AnimationImage({
    required this.asset,
    this.isRepeat = true, // デフォルト値を true に設定
  });

  final String asset;
  final bool isRepeat;

  @override
  State<AnimationImage> createState() => _AnimationImageState();
}

class _AnimationImageState extends State<AnimationImage> with TickerProviderStateMixin {
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
      colorFilter: ColorFilter.mode(context.mainColor, BlendMode.srcATop),
      child: Lottie.asset(
        widget.asset,
        controller: _controller,
        onLoaded: (composition) {
          _controller.duration = composition.duration;
          if (widget.isRepeat) {
            _controller.repeat(); // ループを開始
          } else {
            _controller.forward(); // 一度再生
          }
        },
      ),
    );
  }
}
