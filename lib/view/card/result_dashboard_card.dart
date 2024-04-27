import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

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
                const Gap(10),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      LineIcons.book,
                      color: Colors.black54,
                      size: 28,
                    ),
                    Text(
                      '覚えた問題数',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                if (isChoiceType)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: context.mainColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            height: 8,
                            width: ('${quizItemList.length}'.length.toDouble() +
                                        '${quizItemList.where((x) => x.isJudge).toList().length}'
                                            .length
                                            .toDouble()) *
                                    35 +
                                16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                "${quizItemList.where((x) => x.isJudge).toList().length}",
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(3),
                              const Text(
                                "/",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                "${quizItemList.length}",
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 35,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const Text(
                                '問',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Gap(10),
                    ],
                  )
                else
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: context.mainColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        height: 8,
                        width:
                            ('${quizItemList.length}'.length.toDouble()) * 35 +
                                16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${quizItemList.length}",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(3),
                          const Text(
                            '問',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                const Gap(10),
              ],
            ),

            const Gap(30),

            ///学習時間
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Icon(
                      LineIcons.clock,
                      color: Colors.black54,
                      size: 28,
                    ),
                    Text(
                      '学習時間',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: context.mainColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          height: 8,
                          width:
                              ('$displayDuration'.length.toDouble() - 1) * 35 +
                                  16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "$displayDuration",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(3),
                            const Text(
                              '分',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
