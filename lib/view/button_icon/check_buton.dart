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
      child: Column(
        children: [
          Text(
            "苦手",
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: isCheck ? context.mainColor : Colors.grey.shade500,
              height: 0.1,
            ),
          ),
          Container(
            height: size,
            width: size,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Icon(
              LineIcons.checkSquareAlt,
              size: size * 0.8,
              color: isCheck ? context.mainColor : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
