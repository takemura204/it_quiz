import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/button_icon/save_button.dart';

import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';
import '../button_icon/check_buton.dart';

class QuizItemCard extends ConsumerWidget {
  const QuizItemCard({
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
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          children: [
            const Gap(5),

            ///問題文
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '第${index + 1}問',
                          style: const TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        const Gap(5),

                        ///⚪︎×アイコン
                        if (studyType != StudyType.learn)
                          Icon(
                            quizItem.status == StatusType.correct
                                ? Icons.circle_outlined
                                : Icons.clear,
                            size: 25,
                            color: quizItem.status == StatusType.correct
                                ? context.correctColor
                                : context.incorrectColor,
                          )

                        ///何周目
                        else
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                "${quizItem.lapIndex}",
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const Text(
                                "周",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),

                        const Spacer(),
                        Row(
                          children: [
                            // 苦手ボタン
                            if (onTapCheckButton != null)
                              CheckBoxIconButton(
                                isCheck: quizItem.isWeak,
                                size: 30,
                                onTap: onTapCheckButton,
                              ),
                            // 保存ボタン
                            if (onTapSaveButton != null)
                              SaveIconButton(
                                quizItem: quizItem,
                                size: 30,
                                isShowText: true,
                                onTap: onTapSaveButton,
                              ),
                          ],
                        )
                      ],
                    ),
                    const Gap(5),
                    if (studyType == StudyType.choice) ...[
                      const Text(
                        '【問題】',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
                        child: Text(
                          '${quizItem.question}',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Gap(5),
                      const Text(
                        '【答え】',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
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
                        const Text(
                          '【出題】',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
                          child: Text(
                            '${quizItem.source}',
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ] else ...[
                      const Text(
                        '【用語】',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
                        child: Text(
                          '${quizItem.word}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.mainColor,
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
                    ],
                  ],
                ),
              ),
            ),

            const Gap(5),
          ],
        ),
      ),
    );
  }
}
