import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';

import '../../controller/home_dashboard/home_dashboard_screen_controller.dart';

part 'home_dashboard_view/home_dashboard_barchart.dart';
part 'home_dashboard_view/home_dashboard_view.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ///X軸操作
          // _SetTodayData(),

          ///X軸範囲
          _SelectDayLength(),

          ///学習状況ダッシュボード
          _WeekDashboard(),

          ///目標値設定
          _SetGoalY(),

          ///デイリーミッション
          _DailyMission(),

          ///詳細
          _TotalScore(),
        ],
      ),
    );
  }
}

///1週間のデータ
class _WeekDashboard extends ConsumerWidget {
  const _WeekDashboard();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.35,
      width: context.width * 1,
      alignment: Alignment.center,
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
        child: Padding(
          padding: EdgeInsets.all(context.height * 0.01),
          child: Column(
            children: [
              ///凡例
              const _Legend(),
              const Spacer(),

              ///ダッシュボード
              _BarChartSample(),
            ],
          ),
        ),
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
      height: context.height * 0.2,
      width: context.width * 1,
      child: Card(
        elevation: 3,
        color: Colors.blue.shade200,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              "デイリーミッション",
              style: TextStyle(fontSize: context.width * 0.05),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _TotalScore extends ConsumerWidget {
  const _TotalScore();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.2,
      width: context.width * 1,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.01),
      color: Colors.grey.shade200,
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              Container(
                height: context.height * 0.1,
                width: context.width * 0.48,
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.only(
                    left: context.width * 0.02,
                    right: context.width * 0.01,
                    top: context.width * 0.02,
                    bottom: context.width * 0.01,
                  ),
                  color: Colors.green.shade200,
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        "通算ログイン",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: context.width * 0.05,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Container(
                height: context.height * 0.1,
                width: context.width * 0.48,
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.only(
                    left: context.width * 0.01,
                    right: context.width * 0.02,
                    top: context.width * 0.02,
                    bottom: context.width * 0.01,
                  ),
                  color: Colors.green.shade200,
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        "達成クイズ数",
                        style: TextStyle(fontSize: context.width * 0.05),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                height: context.height * 0.1,
                width: context.width * 0.48,
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.only(
                    left: context.width * 0.02,
                    right: context.width * 0.01,
                    top: context.width * 0.01,
                    bottom: context.width * 0.02,
                  ),
                  color: Colors.green.shade200,
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        "苦手クイズ数",
                        style: TextStyle(fontSize: context.width * 0.05),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Container(
                height: context.height * 0.1,
                width: context.width * 0.48,
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.only(
                    left: context.width * 0.01,
                    right: context.width * 0.02,
                    top: context.width * 0.01,
                    bottom: context.width * 0.02,
                  ),
                  color: Colors.green.shade200,
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        "経験値",
                        style: TextStyle(fontSize: context.width * 0.05),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
