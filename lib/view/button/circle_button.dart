import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    this.onTap,
    required this.icon,
    required this.size,
    required this.color,
  });

  final Function()? onTap;
  final Widget icon;
  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null
          ? null
          : () {
              onTap!();
              HapticFeedback.lightImpact();
            },
      child: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: icon,
      ),
    );
  }
}
