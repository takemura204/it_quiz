import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

class DefaultButton extends ConsumerWidget {
  const DefaultButton({
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  final double width;
  final double height;
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          side: BorderSide(
            color: onPressed == null ? Colors.white10 : context.mainColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: onPressed == null
                    ? Colors.grey.shade500
                    : context.mainColor,
                size: height * 0.58,
              ),
            SizedBox(width: icon != null ? 6.0 : 0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: onPressed == null
                    ? Colors.grey.shade500
                    : context.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: height < context.height * 0.05 ? 14 : 16,
              ),
            ),
          ],
        ),
        onPressed: onPressed == null
            ? null
            : () {
                onPressed!();
                HapticFeedback.lightImpact();
              },
      ),
    );
  }
}
