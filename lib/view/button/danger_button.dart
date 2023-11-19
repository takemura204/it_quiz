import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

class DangerButton extends ConsumerWidget {
  const DangerButton({
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  });

  final double width;
  final double height;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 1,
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          side: BorderSide(
            color: onPressed == null ? Colors.white10 : Colors.red,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: onPressed == null ? Colors.black45 : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: context.height * 0.02,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
