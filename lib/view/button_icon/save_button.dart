import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/quiz_item/quiz_item.dart';

class SaveIconButton extends HookConsumerWidget {
  const SaveIconButton(
      {required this.quizItem,
      required this.size,
      required this.isShowText,
      required this.onTap});

  final QuizItem quizItem;
  final bool isShowText;
  final double size;
  final VoidCallback? onTap;

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
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isShowText)
            Text(
              "保存",
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color:
                    quizItem.isSaved ? context.mainColor : Colors.grey.shade500,
                height: 0.1,
              ),
            ),
          Container(
            height: size,
            width: size,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Icon(
              quizItem.isSaved ? Icons.bookmark_sharp : LineIcons.bookmark,
              size: size * 0.9,
              color:
                  quizItem.isSaved ? context.mainColor : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
