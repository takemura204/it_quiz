import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/quiz_learn/quiz_learn_screen_controller.dart';
import '../../model/quiz/quiz.dart';

/// 今日の学習
class ResultDashboardCard extends ConsumerWidget {
  const ResultDashboardCard(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(quizLearnScreenProvider);
    final duration = controller.duration;
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    final displayDuration = (minutes + seconds / 60).toStringAsFixed(1);

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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "${quiz.quizItemList.length}",
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
