import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

class ResultDashboardCard extends ConsumerWidget {
  const ResultDashboardCard({
    required this.quizItemList,
    required this.resultQuizItemList,
    required this.duration,
  });

  final List<QuizItem> quizItemList;
  final List<QuizItem> resultQuizItemList;
  final Duration duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studyType = ref.watch(quizModelProvider).studyType;
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    final displayDuration = (minutes + seconds / 60).toStringAsFixed(1);

    return Card(
      elevation: 1,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///覚えた数
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      LineIcons.book,
                      color: Colors.black54,
                      size: 20,
                    ),
                    Text(
                      I18n().setResultDashboardCountTitle(studyType),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      LineIcons.book,
                      color: Colors.transparent,
                      size: 20,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: context.mainColor,
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                          ),
                          height: 8,
                          width: ('${quizItemList.length}'.length.toDouble() +
                                      '${quizItemList.where((x) => x.status == StatusType.correct).toList().length}'
                                          .length
                                          .toDouble()) *
                                  30 +
                              14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "${resultQuizItemList.length}",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(3),
                            const Text(
                              "/",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const Gap(3),
                            Text(
                              "${quizItemList.length}",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 30,
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
                ),
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
                      size: 20,
                    ),
                    Text(
                      '学習時間',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                          ),
                          height: 8,
                          width: ('$displayDuration'.length.toDouble() - 1) * 30 + 14,
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
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(3),
                            const Text(
                              '分',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
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
