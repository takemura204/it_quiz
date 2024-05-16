import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

///チェエクボックスボタン
class CheckBoxIconButton extends ConsumerWidget {
  const CheckBoxIconButton(
      {required this.onTap, required this.isCheck, required this.size});

  final VoidCallback? onTap;
  final bool isCheck;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap != null
          ? () {
              onTap!();
              HapticFeedback.lightImpact();
            }
          : null,
      child: Container(
        width: size,
        child: Column(
          children: [
            Text(
              "苦手",
              style: TextStyle(
                fontSize: context.width * 0.025,
                fontWeight: FontWeight.bold,
                color: isCheck ? context.mainColor : Colors.grey,
              ),
            ),
            Container(
              height: size,
              width: size,
              padding: EdgeInsets.zero,
              child: Icon(
                LineIcons.checkSquareAlt,
                size: size * 0.825,
                color: isCheck ? context.mainColor : Colors.grey,
              ),
            ),
            Text(
              "",
              style: TextStyle(
                fontSize: context.width * 0.025,
                fontWeight: FontWeight.bold,
                color: isCheck ? context.mainColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
