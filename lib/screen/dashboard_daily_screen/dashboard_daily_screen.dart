import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/dashboard/dashboard_model.dart';
import '../../model/user/user.model.dart';
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
    final userModel = ref.watch(userModelProvider);
    final dailyQuizCountGoal = userModel.userCustom.dailyQuizCountGoal;
    final dailyRate = (dailyQuizCount / dailyQuizCountGoal * 100)
        .clamp(0, 100)
        .toStringAsFixed(1);

    return Card(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.01, vertical: context.width * 0.01),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///タイトル
          const _Title(
            title: "今日の学習",
            subWidget: null,
            icon: LineIcons.fontAwesomeFlag,
          ),
          Gap(context.height * 0.01),
          Container(
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(context.height * 0.005),
                    _DailyQuizCount(score: dailyQuizCount),
                    Gap(context.height * 0.005),
                    _DailyDuration(score: dailyDuration),
                    Gap(context.height * 0.005),
                    _DailyLogin(score: runningDays),
                    Gap(context.height * 0.005),
                  ],
                ),
                Gap(context.height * 0.02),
                const Spacer(),
                ProgressCrilcleChart(
                  width: context.height * 0.4,
                  size: context.width * 0.45,
                  goalScore: dailyQuizCountGoal,
                  currentScore: dailyQuizCount,
                  thickness: 0.15,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "今日の目標",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.height * 0.018,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Gap(context.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "$dailyRate",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.height * 0.035,
                              color: context.mainColor,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            "%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.height * 0.025,
                              color: context.mainColor,
                              height: 1.0,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      Gap(context.height * 0.01),
                      Text(
                        "$dailyQuizCount/$dailyQuizCountGoal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.height * 0.018,
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
