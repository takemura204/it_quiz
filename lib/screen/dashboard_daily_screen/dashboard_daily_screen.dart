import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/dashboard/dashboard_model.dart';
import '../../model/user/user.model.dart';

part 'dashboard_daily_view.dart';

/// 今日の学習
class DailyDashboard extends ConsumerWidget {
  const DailyDashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardModel = ref.watch(dashboardModelProvider);
    final dailyDuration = dashboardModel.dailyDuration.inMinutes;
    final dailyQuizCount = dashboardModel.dailyQuizCount;
    final userModel = ref.watch(userModelProvider);
    final dailyQuizCountGoal = userModel.userCustom.dailyQuizCountGoal;
    final dailyDurationGoal = userModel.userCustom.dailyDurationGoal;

    return Card(
      elevation: 3,
      color: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.01),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.mainColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ///タイトル
          const _Title(
            title: "今日の学習",
            subWidget: null,
            icon: LineIcons.fontAwesomeFlag,
          ),
          Gap(context.height * 0.02),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    LineIcons.book,
                    color: context.mainColor,
                    size: context.width * 0.1,
                  ),
                  Text(
                    '問題数',
                    style: TextStyle(
                      color: context.mainColor,
                      fontSize: context.height * 0.015,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(context.height * 0.005),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "$dailyQuizCount",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: context.height * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "/$dailyQuizCountGoal",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: context.height * 0.027,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '問',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: context.height * 0.018,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    LineIcons.clock,
                    color: context.mainColor,
                    size: context.width * 0.1,
                  ),
                  Text(
                    '学習時間',
                    style: TextStyle(
                      color: context.mainColor,
                      fontSize: context.height * 0.015,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(context.height * 0.005),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$dailyDuration',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: context.height * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "/$dailyDurationGoal",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: context.height * 0.027,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '分',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: context.height * 0.018,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    LineIcons.alternateFire,
                    color: context.mainColor,
                    size: context.width * 0.1,
                  ),
                  Text(
                    'スコア',
                    style: TextStyle(
                      color: context.mainColor,
                      fontSize: context.height * 0.015,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(context.height * 0.005),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '80',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: context.height * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(3),
                      Text(
                        'up↑',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: context.height * 0.023,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'exp',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: context.height * 0.018,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(context.height * 0.01),
        ],
      ),
    );
  }
}
