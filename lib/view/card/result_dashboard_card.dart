import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz_item/quiz_item.dart';

class ResultDashboardCard extends ConsumerWidget {
  const ResultDashboardCard(this.quizItemList, this.duration);

  final List<QuizItem> quizItemList;
  final Duration duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    final displayDuration = (minutes + seconds / 60).toStringAsFixed(1);
    final studyType = ref.watch(quizModelProvider).studyType;
    final isChoiceType = studyType == StudyType.choice;

    return Card(
      elevation: 1,
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///覚えた問題数
            Column(
              children: [
                Gap(context.height * 0.01),
                Row(
                  children: [
                    Icon(
                      LineIcons.book,
                      color: Colors.black54,
                      size: context.width * 0.06,
                    ),
                    Text(
                      '覚えた問題数',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: context.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gap(context.height * 0.005),
                if (isChoiceType)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${quizItemList.where((x) => x.isJudge).toList().length}",
                            style: TextStyle(
                              color: context.mainColor,
                              fontSize: context.width * 0.08,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(3),
                          Text(
                            "/",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: context.width * 0.06,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "${quizItemList.length}",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: context.width * 0.08,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const Gap(3),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          '問',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: context.width * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${quizItemList.length}",
                        style: TextStyle(
                          color: context.mainColor,
                          fontSize: context.width * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(3),
                      Text(
                        '問',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: context.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            Gap(context.width * 0.1),

            ///学習時間
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(context.height * 0.01),
                Row(
                  children: [
                    Icon(
                      LineIcons.clock,
                      color: Colors.black54,
                      size: context.width * 0.06,
                    ),
                    Text(
                      '学習時間',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: context.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gap(context.height * 0.005),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Gap(context.width * 0.05),
                    Text(
                      "$displayDuration",
                      style: TextStyle(
                        color: context.mainColor,
                        fontSize: context.width * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(3),
                    Text(
                      '分',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: context.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
