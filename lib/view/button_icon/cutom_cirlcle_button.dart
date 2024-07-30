import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCircleButton extends ConsumerWidget {
  const CustomCircleButton({
    required this.iconData,
    required this.iconSize,
    required this.containerSize,
    required this.iconColor,
    required this.containerColor,
    required this.text,
    required this.onPressed,
  });

  final IconData iconData;
  final double iconSize;
  final double containerSize;
  final Color containerColor;
  final Color iconColor;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 1,
      color: containerColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90),
        side: containerColor == Colors.white
            ? BorderSide(color: iconColor, width: 1)
            : BorderSide(color: containerColor, width: 0),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: containerSize,
        height: containerSize,
        child: IconButton(
          icon: Icon(
            iconData,
            color: iconColor,
            size: iconSize,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
