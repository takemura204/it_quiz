import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/mission/mission_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../controller/dashboard_analytics/dashboard_analytics_controller.dart';
import '../../model/mission/mission.dart';
import '../../model/mission/mission_model.dart';
import '../bar.dart';
import '../button.dart';
import '../icon.dart';
import '../icon_button.dart';

///クイズモーダル
class DailyMissionModal extends ConsumerWidget {
  const DailyMissionModal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(missionControllerProvider);
    final _timeLimit = state.timeLimit;

    final model = ref.watch(missionModelProvider);
    final missions = model.sortedMissions;

    final dashboardState = ref.watch(dashboardAnalyticsProvider);

    if (dashboardState.isLoading && model.isLoading) {
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

    return SimpleDialog(
      insetPadding: EdgeInsets.all(context.width * 0.02),
      contentPadding: EdgeInsets.all(context.width * 0.02),
      children: [
        Container(
          height: context.height * 0.52,
          width: context.width * 1,
          child: Column(
            children: [
              _Title(
                title: "デイリーミッション",
                subtitle: "あと $_timeLimit",
                icon: Icons.pending_actions_outlined,
              ),
              Container(
                height: context.height * 0.46,
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
                            .shuffleMissionIndex(3);
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
                            .shuffleMissionIndex(4);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title(
      {required this.title, required this.subtitle, required this.icon});

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.04,
      margin: EdgeInsets.only(
        top: context.width * 0.015,
        bottom: 0.00,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: context.mainColor, width: context.width * 0.003),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            icon,
            color: context.mainColor,
            size: context.height * 0.04,
          ),
          Gap(context.width * 0.01),
          Text(
            title,
            style: TextStyle(
                fontSize: context.height * 0.024,
                color: context.mainColor,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: context.height * 0.018,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

///デイリーミッションCard
class _DailyMissionCard extends ConsumerWidget {
  const _DailyMissionCard(
      {required this.mission,
      required this.currentValue,
      required this.goalValue,
      required this.isRandomIconButton,
      required this.randomIconButtonTap});

  final Mission mission;
  final int currentValue;
  final int goalValue;
  final bool isRandomIconButton;
  final VoidCallback randomIconButtonTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDone = currentValue >= goalValue;
    return Container(
      height: context.height * 0.09,
      child: Card(
        elevation: 0,
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.0, vertical: context.width * 0.0),
        child: Row(
          children: [
            ///ミッションアイコン
            Container(
              width: context.height * 0.05,
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.width * 0.01),
              child: (isDone && mission.isReceived)
                  ? Column(
                      children: [
                        const Spacer(),
                        CompleteIcon(
                          size: context.height * 0.045,
                        ),
                        Gap(context.width * 0.01),
                        Text(
                          "+${mission.point}pt",
                          style: TextStyle(
                            fontSize: context.height * 0.015,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                      ],
                    )
                  : Column(
                      children: [
                        const Spacer(),
                        PointIcon(size: context.height * 0.045),
                        Gap(context.width * 0.01),
                        Text(
                          "+${mission.point}pt",
                          style: TextStyle(
                            fontSize: context.height * 0.015,
                            fontWeight: FontWeight.bold,
                            color: context.mainColor,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
            ),
            Gap(context.width * 0.01),

            ///ミッション状況
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(context.width * 0.01),
                  const Spacer(),
                  Row(
                    children: [
                      ///ミッション内容
                      Text(
                        mission.title,
                        style: TextStyle(
                          fontSize: context.width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                      const Spacer(),

                      ///ランダムボタン
                      if (!isDone) ...[
                        if (isRandomIconButton)
                          RandomIconButton(
                            onPressed: randomIconButtonTap,
                            isCheck: true,
                          ),
                      ],

                      Gap(context.width * 0.03),
                    ],
                  ),
                  Gap(context.height * 0.01),
                  if (!isDone) ...[
                    ///プログレスバー
                    ProgressLineBar(
                      height: context.height * 0.025,
                      width: context.width * 0.75,
                      currentScore: currentValue,
                      goalScore: goalValue,
                      isUnit: true,
                    ),
                  ],
                  if (isDone && !mission.isReceived) ...[
                    Row(
                      children: [
                        const Spacer(),
                        PrimaryButton(
                            width: context.width * 0.3,
                            height: context.height * 0.035,
                            text: "受取",
                            onPressed: () => ref
                                .read(missionControllerProvider.notifier)
                                .tapMissionReceiveButton(mission)),
                        Gap(context.width * 0.02),
                      ],
                    ),
                  ],
                  if (isDone && mission.isReceived) ...[
                    Row(
                      children: [
                        const Spacer(),
                        DisabledButton(
                          width: context.width * 0.3,
                          height: context.height * 0.035,
                          text: "受取済み",
                        ),
                        Gap(context.width * 0.02),
                      ],
                    ),

                    // CompleteIcon(size: context.height * 0.075),
                  ],
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
