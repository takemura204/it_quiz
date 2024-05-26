import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

class PrimaryButton extends ConsumerWidget {
  const PrimaryButton({
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
          backgroundColor: context.mainColor,
          elevation: 0,
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
                size: height * 0.6,
              ),
            SizedBox(width: icon != null ? 6.0 : 0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: height <= 5 ? 14 : 16,
              ),
            ),
            const Spacer(),
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

///ログイン・ログアウトボタン
class PrimaryRoundButton extends ConsumerWidget {
  const PrimaryRoundButton({
    required this.text,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.onPressed,
  });

  final double height;
  final double width;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
