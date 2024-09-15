import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/button_icon/save_button.dart';
import 'package:kentei_quiz/view/button_icon/weak_buton.dart';

import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';
import '../tag/category_tag.dart';
import '../tag/importance_tag.dart';
import '../tag/status_tag.dart';

class ResultItemCard extends ConsumerWidget {
  const ResultItemCard({
    required this.index,
    required this.quizItem,
    required this.studyType,
    required this.onTapCheckButton,
    required this.onTapSaveButton,
  });

  final int index;
  final QuizItem quizItem;
  final StudyType studyType;
  final VoidCallback? onTapCheckButton;
  final VoidCallback? onTapSaveButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.0)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(5),
                  if (studyType == StudyType.choice)
                    _ChoiceQuizItem(quizItem: quizItem)
                  else
                    _LearnQuizItem(quizItem: quizItem),
                  const Gap(10),
                  Row(
                    children: [
                      ///カテゴリ
                      CategoryTag(quizItem: quizItem),
                      const Gap(5),

                      ///重要度
                      ImportanceTag(quizItem: quizItem),
                      const Gap(5),

                      ///ステータス
                      StatusTag(quizItem: quizItem),
                      const Spacer(),

                      ///苦手
                      WeakIconButton(
                        quizItem: quizItem,
                        size: 32,
                        onTap: onTapCheckButton,
                      ),

                      ///保存
                      SaveIconButton(
                        quizItem: quizItem,
                        isShowText: true,
                        size: 32,
                        onTap: onTapSaveButton,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///用語の解説
class _LearnQuizItem extends ConsumerWidget {
  const _LearnQuizItem({required this.quizItem});

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
          child: Row(
            children: [
              if (quizItem.isKnow)
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: context.correctColor, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.thumb_up, color: context.correctColor, size: 15))
              else
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: context.incorrectColor, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.question_mark_outlined,
                        color: context.incorrectColor, size: 15)),
              const Gap(5),
              Expanded(
                child: Text(
                  '${quizItem.word}',
                  style: context.texts.titleLarge!.copyWith(
                      color: quizItem.isKnow ? context.correctColor : context.incorrectColor),
                ),
              ),
            ],
          ),
        ),
        const Gap(5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
          child: Text(
            '${quizItem.comment}',
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }
}

///クイズの解説
class _ChoiceQuizItem extends ConsumerWidget {
  const _ChoiceQuizItem({required this.quizItem});

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '【問題】',
          style: TextStyle(color: Colors.black87),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
          child: Text(
            '${quizItem.question}',
            style: const TextStyle(color: Colors.black87),
          ),
        ),
        const Gap(5),
        const Text(
          '【答え】',
          style: TextStyle(color: Colors.black87, fontSize: 14),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
          child: Text(
            '${quizItem.ans}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: quizItem.status == StatusType.correct
                  ? context.correctColor
                  : context.incorrectColor,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        const Gap(5),
        const Text(
          '【解説】',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
          child: Text(
            '${quizItem.comment}',
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
        if (quizItem.source != '') ...[
          const Gap(5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
            child: Text(
              '出典：${quizItem.source}',
              style: const TextStyle(),
            ),
          ),
        ],
      ],
    );
  }
}
