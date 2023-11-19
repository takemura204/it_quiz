import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

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
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                  fontSize: context.width * 0.04,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
