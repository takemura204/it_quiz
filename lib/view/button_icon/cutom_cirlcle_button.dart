import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCircleButton extends ConsumerWidget {
  const CustomCircleButton({
    required this.iconData,
    required this.onPressed,
    required this.iconSize,
    required this.containerWidth,
    required this.containerHeight,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });

  final IconData iconData;
  final VoidCallback onPressed;
  final double iconSize;
  final double containerWidth;
  final double containerHeight;
  final Color backgroundColor;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 1,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: backgroundColor == Colors.white
            ? BorderSide(color: textColor, width: 1.5)
            : BorderSide(color: backgroundColor, width: 0),
      ),
      child: Container(
        width: containerWidth,
        // height: containerHeight,
        child: IconButton(
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(5),
              Icon(
                iconData,
                color: textColor,
                size: iconSize,
              ),

              const Gap(5), // アイコンとテキストの間隔
              Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(5),
            ],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
