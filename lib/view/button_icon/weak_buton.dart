import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/quiz_item/quiz_item.dart';

///チェエクボックスボタン
class WeakIconButton extends ConsumerWidget {
  const WeakIconButton(
      {required this.quizItem, required this.isShowText, required this.onTap, required this.size});

  final QuizItem quizItem;
  final VoidCallback? onTap;
  final bool isShowText;
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
          if (isShowText)
            Text(
              "苦手",
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: quizItem.isWeak ? context.mainColor : Colors.grey.shade500,
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
              color: quizItem.isWeak ? context.mainColor : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
