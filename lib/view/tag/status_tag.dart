import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///ステータス
class StatusTag extends ConsumerWidget {
  const StatusTag({required this.quizItem});

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color iconColor(StatusType statusType) {
      switch (statusType) {
        case StatusType.correct:
          return context.correctColor;
        case StatusType.incorrect:
          return context.incorrectColor;
        case StatusType.learned:
          return context.backgroundColor;
        case StatusType.unlearned:
          return context.secondColor;
        default:
          return context.secondColor;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor(quizItem.status),
                border: Border.all(
                    width: 1,
                    color: iconColor(quizItem.status) == context.backgroundColor
                        ? context.mainColor
                        : iconColor(quizItem.status)),
              ),
            ),
            const Gap(3),
            Text(I18n().quizStatusTypeText(quizItem.status),
                style:
                    context.texts.bodyMedium?.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
            const Gap(3),
          ],
        ),
      ),
    );
  }
}
