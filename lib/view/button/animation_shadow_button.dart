import 'package:flutter/cupertino.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/button/primary_button.dart';

class AnimatedShadowButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback? onPressed;

  const AnimatedShadowButton({
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  });

  @override
  _AnimatedShadowButtonState createState() => _AnimatedShadowButtonState();
}

class _AnimatedShadowButtonState extends State<AnimatedShadowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: context.mainColor.withOpacity(0.7),
                  spreadRadius: _controller.value * 10,
                  blurRadius: _controller.value * 10,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: PrimaryButton(
              width: widget.width,
              height: widget.height,
              text: widget.text,
              onPressed: widget.onPressed,
            ),
          ),
        );
      },
    );
  }
}
