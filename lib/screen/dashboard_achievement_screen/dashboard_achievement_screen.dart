import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/dashboard_achievement/dashboard_achievement_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/mission/mission.dart';
import 'package:kentei_quiz/view/bar.dart';
import 'package:kentei_quiz/view/button.dart';

import '../../controller/dashboard_analytics/dashboard_analytics_controller.dart';
import '../../model/mission/mission_model.dart';
import '../../view/icon.dart';
import '../../view/icon_button.dart';

part 'dashboard_achievement_view.dart';

class DashBoardAchievementScreen extends ConsumerWidget {
  const DashBoardAchievementScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Gap(5),

          ///称号レベル
          _RankRate(),

          ///デイリーミッション
          _DailyMission(),
        ],
      ),
    );
  }
}

///　デイリーミッション
class _DailyMission extends ConsumerWidget {
  const _DailyMission();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardAnalyticsProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.22,
        ),
      );
    }
    final dailyData = state.dailyData!;
    final dailyScore = dailyData.quizData.length;
    final correctScore =
        dailyData.quizData.where((x) => x.isJudge == true).toList().length;
    final dailyGoal = ref.watch(dashboardAnalyticsProvider).dailyGoal;
    final timeLimit = ref.watch(dashboardAchievementProvider).timeLimit;

    final missions = ref.watch(missionModelProvider).missions;

    return Container(
      height: context.height * 0.52,
      width: context.width * 1,
      child: Card(
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
            _Title(
              title: "デイリーミッション",
              subtitle: "あと $timeLimit",
              icon: Icons.pending_actions_outlined,
            ),
            const Spacer(),
            Container(
              height: context.height * 0.455,
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.width * 0.0),
              child: Column(
                children: [
                  ///ミッション1(ログイン)
                  _DailyMissionCard(
                    mission: missions[0],
                    currentValue: 1,
                    goalValue: 1,
                    isRandomIconButton: false,
                    randomIconButtonTap: () {},
                  ),
                  Divider(color: context.mainColor, height: 1, thickness: 1),

                  ///ミッション2(問題数)
                  _DailyMissionCard(
                    mission: missions[1],
                    currentValue: dailyScore,
                    goalValue: 10,
                    isRandomIconButton: false,
                    randomIconButtonTap: () {},
                  ),
                  Divider(color: context.mainColor, height: 1, thickness: 1),

                  ///ミッション3(目標を達成)
                  _DailyMissionCard(
                    mission: missions[2],
                    currentValue: dailyScore,
                    goalValue: dailyGoal,
                    isRandomIconButton: false,
                    randomIconButtonTap: () {},
                  ),
                  Divider(color: context.mainColor, height: 1, thickness: 1),

                  ///ミッション4(正解数)
                  _DailyMissionCard(
                    mission: missions[3],
                    currentValue: correctScore,
                    goalValue: missions[3].point,
                    isRandomIconButton: true,
                    randomIconButtonTap: () {
                      ref
                          .read(missionModelProvider.notifier)
                          .shuffleMission1Index();
                    },
                  ),
                  Divider(color: context.mainColor, height: 1, thickness: 1),

                  ///ミッション5(何かに挑戦)
                  _DailyMissionCard(
                    mission: missions[4],
                    currentValue: dailyScore,
                    goalValue: 1,
                    isRandomIconButton: true,
                    randomIconButtonTap: () {
                      ref
                          .read(missionModelProvider.notifier)
                          .shuffleMission2Index();
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

///　ランクレート
class _RankRate extends ConsumerWidget {
  const _RankRate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardAchievementProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.22,
        ),
      );
    }
    final rankData = state.rankData!;
    final rankDataList =
        ref.watch(dashboardAchievementProvider.notifier).rankDataList;
    final maxScore = rankData.levelUpScore *
        ((rankData.rankLevel + 1) - rankDataList[rankData.rankId].rankLevel);

    return Container(
      height: context.height * 0.25,
      child: Card(
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
              title: "称号レベル",
              subtitle: "",
              icon: Icons.workspace_premium_outlined,
            ),
            const Spacer(),

            Row(
              children: [
                const Spacer(),

                ///レベル
                GestureDetector(
                  onTap: () {
                    ref
                        .read(dashboardAchievementProvider.notifier)
                        .updateScore(10);
                  },
                  child: ProgressRangeChart(
                    width: context.height * 0.17,
                    size: context.height * 0.17,
                    maxScore: rankData.levelUpScore,
                    currentScore: rankData.score % rankData.levelUpScore,
                    widget: Column(
                      children: [
                        const Spacer(),
                        Text(
                          "Lv.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.height * 0.025,
                            color: context.mainColor,
                            height: 1.0,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          "${rankData.rankLevel}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.height * 0.05,
                            color: context.mainColor,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const Spacer(),

                /// 称号
                Container(
                  width: context.width * 0.5,
                  height: context.height * 0.17,
                  child: const _RankName(),
                ),
                const Spacer(),
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
