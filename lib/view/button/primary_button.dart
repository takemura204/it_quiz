import 'package:flutter/material.dart';
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
          elevation: 1,
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
                size: height * 0.58,
              ),
            SizedBox(width: icon != null ? 6.0 : 0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: height < context.height * 0.05
                    ? context.height * 0.015
                    : context.height * 0.02,
              ),
            ),
            const Spacer(),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}

///ログイン・ログアウトボタン
class SetAccountButton extends ConsumerWidget {
  const SetAccountButton({required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.06,
      width: context.width * 1,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.2, vertical: context.width * 0.01),
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
            fontSize: context.height * 0.018,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
