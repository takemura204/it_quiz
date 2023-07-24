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
import '../../model/rank/rank.dart';
import '../../model/rank/rank_model.dart';
import '../../view/icon.dart';
import '../../view/icon_button.dart';

part 'dashboard_achievement_view.dart';

///　デイリーミッション
class DailyMission extends ConsumerWidget {
  const DailyMission();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardAnalyticsProvider);
    final missionModel = ref.watch(missionModelProvider);
    if (dashboardState.isLoading && missionModel.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.1,
        ),
      );
    }
    final dailyData = dashboardState.dailyData!;
    final dailyScore = dailyData.quizData.length;
    final correctScore =
        dailyData.quizData.where((x) => x.isJudge == true).toList().length;
    final dailyGoal = ref.watch(dashboardAnalyticsProvider).dailyGoal;
    final timeLimit = ref.watch(dashboardAchievementProvider).timeLimit;
    final missions = missionModel.sortedMissions;
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

///　ランクスコア
class RankScore extends ConsumerWidget {
  const RankScore();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rankModelProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.22,
        ),
      );
    }
    final rank = state.rank!;
    final rankDataList = ref.watch(rankModelProvider.notifier).defaultRanks;
    final maxScore = rank.levelUpScore *
        ((rank.level + 1) - rankDataList[rank.rankId].level);

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
              title: "スコア",
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
                    ref.read(rankModelProvider.notifier).updateScore(10);
                  },
                  child: ProgressRangeChart(
                    width: context.height * 0.17,
                    size: context.height * 0.17,
                    maxScore: rank.levelUpScore,
                    currentScore: rank.score % rank.levelUpScore,
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
                          "${rank.level}",
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
                _RankName(rank: rank),
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
