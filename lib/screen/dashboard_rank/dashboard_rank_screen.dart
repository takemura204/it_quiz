import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/dashboard_rank/dashboard_rank_controller.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/mission/mission.dart';
import 'package:kentei_quiz/view/bar.dart';
import 'package:kentei_quiz/view/button.dart';

import '../../controller/dashboard_analytics/dashboard_analytics_controller.dart';
import '../../resource/mission/mission_model.dart';
import '../../view/icon.dart';

part 'dashboard_rank_view.dart';

class DashBoardRankScreen extends ConsumerWidget {
  const DashBoardRankScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Gap(5),

          ///デイリーミッション
          _DailyMission(),

          ///称号レベル
          _RankRate(),
        ],
      ),
    );
  }
}

///　やることリスト
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
    final dailyScore = state.dailyData!.quizData.length;
    final dailyGoal = ref.watch(dashboardAnalyticsProvider).dailyGoal;
    final model = ref.watch(missionModelProvider.notifier);
    return Container(
      height: context.height * 0.36,
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
            const _Title(
              title: "デイリーミッション",
              subtitle: "あと〇〇時間",
              icon: Icons.pending_actions_outlined,
            ),
            const Spacer(),
            Container(
              height: context.height * 0.3,
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.width * 0.0),
              child: Column(
                children: [
                  const Spacer(),

                  ///ミッション1
                  _DailyMissionCard(
                    mission: model.mission1[0],
                    currentScore: dailyScore,
                    goalScore: dailyGoal,
                    randomIconButtonTap: () {},
                  ),
                  Divider(color: context.mainColor, height: 1, thickness: 1),

                  ///ミッション2
                  _DailyMissionCard(
                    mission: model.mission2[0],
                    currentScore: dailyScore,
                    goalScore: dailyGoal,
                    randomIconButtonTap: () {},
                  ),
                  Divider(color: context.mainColor, height: 1, thickness: 1),

                  ///ミッション3
                  _DailyMissionCard(
                    mission: model.mission3[0],
                    currentScore: dailyScore,
                    goalScore: dailyGoal,
                    randomIconButtonTap: () {},
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
    final state = ref.watch(dashboardRankProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.22,
        ),
      );
    }
    final rankData = state.rankData!;
    final rankDataList = ref.watch(dashboardRankProvider.notifier).rankDataList;
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
                    ref.read(dashboardRankProvider.notifier).updateScore(10);
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
