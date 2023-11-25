import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

///チェエクボックスボタン
class CheckBoxIconButton extends ConsumerWidget {
  const CheckBoxIconButton(
      {required this.onPressed, required this.isCheck, required this.size});

  final VoidCallback? onPressed;
  final bool isCheck;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
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
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                icon: isCheck
                    ? Icon(
                        LineIcons.checkSquareAlt,
                        size: size * 0.825,
                      )
                    : Icon(
                        LineIcons.square,
                        size: size,
                      ),
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
