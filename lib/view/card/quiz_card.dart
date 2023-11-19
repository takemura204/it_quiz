import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../model/quiz_item/quiz_item.dart';
import '../button_icon/check_buton.dart';

class QuizItemCard extends ConsumerWidget {
  const QuizItemCard(
      {required this.item, required this.studyType, required this.onPressed});

  final QuizItem item;
  final StudyType studyType;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Card(
        elevation: 1,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const Gap(5),
            if (studyType != StudyType.learn)

              ///⚪︎×アイコン
              Container(
                width: context.width * 0.1,
                height: context.height * 0.1,
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.01,
                    vertical: context.width * 0.02),
                child: Icon(
                  item.isJudge ? Icons.circle_outlined : Icons.clear,
                  size: context.width * 0.1,
                  color: item.isJudge
                      ? Colors.green.withOpacity(0.7)
                      : Colors.red.withOpacity(0.7),
                ),
              ),

            ///問題文
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.02,
                    vertical: context.height * 0.03),
                child: SubstringHighlight(
                  text: item.question,
                  term: item.ans,
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: context.width * 0.04,
                  ),
                  overflow: TextOverflow.clip,
                  textStyleHighlight: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: item.isJudge
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            ///苦手ボタン
            CheckBoxIconButton(
                isCheck: item.isWeak,
                size: context.width * 0.1,
                onPressed: onPressed),
            const Gap(5),
          ],
        ),
      ),
    );
  }
}
