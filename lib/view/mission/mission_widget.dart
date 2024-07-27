import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/mission/mission_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/dashboard/dashboard_model.dart';
import '../../model/mission/mission.dart';
import '../../model/mission/mission_model.dart';
import '../button/defalut_button.dart';
import '../button/disabled_button.dart';
import '../button/primary_button.dart';
import '../button/secondory_button.dart';
import '../chart/progress_line_chart.dart';
import '../icon.dart';

///クイズモーダル
class DailyMissionWidget extends ConsumerWidget {
  const DailyMissionWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(missionControllerProvider);
    final _timeLimit = state.timeLimit;
    final model = ref.watch(missionModelProvider);
    final missions = model.sortedMissions;
    final userCustom = ref.watch(authModelProvider);
    final dailyGoal = userCustom.dailyGoal;
    final dashboardModel = ref.watch(dashboardModelProvider);
    final dailyQuizCount = dashboardModel.dailyQuizCount;
    final dailyQuizCorrectCount = dashboardModel.dailyQuizCorrectCount;

    return SimpleDialog(
      elevation: 0,
      insetPadding: EdgeInsets.all(context.width * 0.01),
      contentPadding: EdgeInsets.all(context.width * 0.02),
      children: [
        Column(
          children: [
            _Title(
              title: "デイリーミッション",
              subtitle: "あと $_timeLimit",
              icon: Icons.pending_actions_outlined,
            ),

            ///ミッション1(ログイン)
            _DailyMissionCard(
              mission: missions[0],
              currentValue: 1,
              goalValue: 1,
            ),
            Divider(color: context.mainColor, height: 1, thickness: 1),

            ///ミッション2(問題数)
            _DailyMissionCard(
              mission: missions[1],
              currentValue: dailyQuizCount,
              goalValue: 10,
            ),
            Divider(color: context.mainColor, height: 1, thickness: 1),

            ///ミッション3(目標を達成)
            _DailyMissionCard(
              mission: missions[2],
              currentValue: dailyQuizCount,
              goalValue: dailyGoal,
            ),
            Divider(color: context.mainColor, height: 1, thickness: 1),

            ///ミッション4(正解数)
            _DailyMissionCard(
              mission: missions[3],
              currentValue: dailyQuizCorrectCount,
              goalValue: missions[3].exp,
              isRandomIconButton: true,
              randomIconButtonTap: () {
                ref.read(missionModelProvider.notifier).shuffleMissionIndex(3);
              },
            ),
            Divider(color: context.mainColor, height: 1, thickness: 1),

            ///ミッション5(何かに挑戦)
            _DailyMissionCard(
              mission: missions[4],
              currentValue: dailyQuizCount,
              goalValue: 1,
              isRandomIconButton: true,
              randomIconButtonTap: () {
                ref.read(missionModelProvider.notifier).shuffleMissionIndex(4);
              },
            ),
            Divider(color: context.mainColor, height: 1, thickness: 1),

            Gap(context.height * 0.02),
            SecondaryButton(
                width: context.width * 0.4,
                height: context.height * 0.06,
                text: "閉じる",
                onPressed: () {
                  Navigator.pop(context);
                }),
            Gap(context.height * 0.02),
          ],
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
            LineIcons.clipboardWithCheck,
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
  const _DailyMissionCard({
    required this.mission,
    required this.currentValue,
    required this.goalValue,
    this.isRandomIconButton = false,
    this.randomIconButtonTap = _defaultTapAction,
  });

  final Mission mission;
  final int currentValue;
  final int goalValue;
  final bool isRandomIconButton;
  final VoidCallback randomIconButtonTap;

  static void _defaultTapAction() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDone = currentValue >= goalValue;
    return Container(
      height: context.height * 0.1,
      child: Row(
        children: [
          ///ミッションアイコン
          ExpIcon(exp: mission.exp, isCompleted: isDone && mission.isReceived),
          Gap(context.width * 0.02),

          ///ミッション状況
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(context.width * 0.01),
              Text(
                mission.title,
                style: TextStyle(
                  fontSize: context.width * 0.035,
                  color: Colors.black87,
                ),
              ),
              Gap(context.height * 0.01),
              ProgressLineChart(
                height: context.height * 0.02,
                width: context.width * 0.5,
                currentScore: currentValue,
                goalScore: goalValue,
                isUnit: true,
                borderRadius: 8,
              ),
            ],
          ),
          Gap(context.width * 0.02),
          const Spacer(),

          if (!isDone) ...[
            DefaultButton(
              width: context.width * 0.2,
              height: context.height * 0.045,
              text: "挑戦する",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          if (isDone && !mission.isReceived) ...[
            PrimaryButton(
                width: context.width * 0.2,
                height: context.height * 0.045,
                title: "受取",
                onPressed: () => ref
                    .read(missionControllerProvider.notifier)
                    .tapMissionReceiveButton(mission)),
          ],
          if (isDone && mission.isReceived) ...[
            DisabledButton(
              width: context.width * 0.2,
              height: context.height * 0.045,
              text: "受取済み",
            ),
          ],
          const Spacer(),
          Gap(context.width * 0.01),
        ],
      ),
    );
  }
}
