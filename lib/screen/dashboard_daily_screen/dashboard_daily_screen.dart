import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/dashboard/dashboard_model.dart';
import '../../model/user/auth_model.dart';
import '../../view/bar.dart';

part 'dashboard_daily_view.dart';

/// 今日の学習
class DailyDashboard extends ConsumerWidget {
  const DailyDashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardModel = ref.watch(dashboardModelProvider);
    final dailyDuration = dashboardModel.dailyDuration.inMinutes;
    final dailyQuizCount = dashboardModel.dailyQuizCount;
    final runningDays = dashboardModel.runningDays;
    final userModel = ref.watch(authModelProvider);
    final dailyGoal = userModel.dailyGoal;
    final dailyRate =
        (dailyQuizCount / dailyGoal * 100).clamp(0, 100).toStringAsFixed(0);

    return Card(
      elevation: 1,
      color: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.01, vertical: context.width * 0.005),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///タイトル
          const _Title(title: "今日の学習"),
          const Gap(10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(5),
                    _DailyData(
                      title: '問題数',
                      icon: LineIcons.book,
                      score: dailyQuizCount,
                      unit: '問',
                    ),
                    const Gap(5),
                    _DailyData(
                      title: '学習時間',
                      icon: LineIcons.clock,
                      score: dailyDuration,
                      unit: '分',
                    ),
                    const Gap(5),
                    _DailyData(
                      title: '学習日数',
                      icon: LineIcons.calendar,
                      score: runningDays,
                      unit: '日',
                    ),
                    const Gap(5),
                  ],
                ),
                const Spacer(),
                ProgressCrilcleChart(
                  width: context.height * 0.4,
                  size: context.width * 0.46,
                  goalScore: dailyGoal,
                  currentScore: dailyQuizCount,
                  thickness: 0.13,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "今日の目標",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const Text(
                            "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                              height: 1.0,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          const Gap(3),
                          Text(
                            "$dailyRate",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          const Gap(3),
                          const Text(
                            "%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                              height: 1.0,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      const Gap(10),
                      Text(
                        "$dailyQuizCount/$dailyGoal",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Gap(context.height * 0.01),
        ],
      ),
    );
  }
}
