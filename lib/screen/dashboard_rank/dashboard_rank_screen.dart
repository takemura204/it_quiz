import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/dashboard_rank/dahboard_rank_controller.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/view/bar.dart';

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
            const Spacer(),
            const _Title(
              title: "デイリーミッション",
              subtitle: "あと〇〇時間",
              icon: Icons.pending_actions_outlined,
            ),
            const Spacer(),
            Container(
              height: context.height * 0.27,
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.width * 0.01),
              child: Column(
                children: const [
                  Spacer(),

                  ///ミッション1
                  _DailyMissionCard(
                      title: "クイズを10問解く", isDone: true, point: 10),

                  ///ミッション2
                  _DailyMissionCard(
                      title: "今日のクイズに挑戦する", isDone: false, point: 10),

                  ///ミッション3
                  _DailyMissionCard(
                      title: "クイズをコンプリートする", isDone: false, point: 15),

                  Spacer(),
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
    final rankColor = ref.watch(dashboardRankProvider.notifier).rankData;
    return Container(
      height: context.height * 0.28,
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

                ///バッチアイコン
                Container(
                  width: context.width * 0.3,
                  height: context.width * 0.3,
                  child: const _RankBatch(),
                ),
                const Spacer(),

                /// 称号
                Container(
                  width: context.width * 0.6,
                  height: context.width * 0.3,
                  child: const _RankName(),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),

            Gap(context.height * 0.02),
          ],
        ),
      ),
    );
  }
}
