import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isShowText)
              Text(
                "保存",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: quizItem.isSaved ? context.mainColor : Colors.black26,
                ),
              ),
            Icon(
              quizItem.isSaved ? Icons.bookmark_sharp : LineIcons.bookmark,
              size: size,
              color: quizItem.isSaved ? context.mainColor : Colors.black26,
            ),
            Gap(context.height * 0.01),
          ],
        ),
      ),
    );
  }
}
