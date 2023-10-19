import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/chart/weekly_duration_chart.dart';
import 'package:kentei_quiz/view/chart/weekly_quiz_chart.dart';

import '../../controller/dashboard_analytics/dashboard_analytics_controller.dart';
import '../../model/dashboard/dashboard_model.dart';

class WeeklyDashboard extends ConsumerWidget {
  const WeeklyDashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
          child: Column(
            children: [
              const _Title(
                title: "アクティビティ",
                subWidget: null,
                icon: Icons.bar_chart_outlined,
              ),

              Gap(context.height * 0.01),

              ///期間
              Container(
                height: context.height * 0.04,
                margin: EdgeInsets.symmetric(
                    horizontal: context.width * 0.02,
                    vertical: context.width * 0.01),
                child: Row(
                  children: [
                    /// 選択期間
                    const _SelectPeriod(),
                    const Spacer(),

                    /// 選択期間タブ
                    const _SelectPeriodTab(),
                  ],
                ),
              ),

              Gap(context.height * 0.01),

              const _TotalData(),

              Gap(context.height * 0.01),

              ///ダッシュボード
              WeeklyQuizChart(),
              Gap(context.height * 0.03),

              const WeeklyDurationChart(),
              Gap(context.height * 0.005),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title(
      {required this.title, required this.subWidget, required this.icon});

  final String title;
  final Widget? subWidget;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.04,
      margin: EdgeInsets.only(
        left: context.width * 0.02,
        top: context.width * 0.015,
        right: context.width * 0.02,
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
          Gap(context.width * 0.01),
          Text(
            title,
            style: TextStyle(
                fontSize: context.height * 0.023,
                color: context.mainColor,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          if (subWidget != null) ...[subWidget!],
        ],
      ),
    );
  }
}

class _TotalData extends ConsumerWidget {
  const _TotalData();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(dashboardModelProvider);
    final weeklyQuizTotal = model.weeklyQuizTotal;
    final weeklyDurationTotal = model.weeklyDurationTotal.inMinutes;
    final runningDays = model.runningDays;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _StatusCard(text: "連続日数", value: runningDays, unit: "日"),
          _StatusCard(text: "合計問題数", value: weeklyQuizTotal, unit: "問"),
          _StatusCard(text: "合計時間", value: weeklyDurationTotal, unit: "分"),
        ],
      ),
    );
  }
}

class _StatusCard extends ConsumerWidget {
  const _StatusCard(
      {required this.value, required this.text, required this.unit});

  final int value;
  final String text;
  final String unit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.27,
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(context.width * 0.01),
              child: Container(
                child: Text(
                  "$text",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.035),
                ),
              ),
            ),
            Gap(context.height * 0.01),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$value",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.06,
                    ),
                  ),
                  Gap(context.width * 0.02),
                  Text(
                    "$unit",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.width * 0.035),
                  ),
                  Gap(context.width * 0.02),
                ],
              ),
            ),
            Gap(context.width * 0.01),
          ],
        ),
      ),
    );
  }
}

class _SelectPeriod extends ConsumerWidget {
  const _SelectPeriod();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(dashboardModelProvider);
    final weekOffset = model.weekOffset;
    final weekDays = model.weekDays;

    return Container(
      width: context.width * 0.55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.all(context.width * 0.01),
            iconSize: context.width * 0.06,
            onPressed: () {
              if (weekOffset >= -3)
                ref
                    .read(dashboardModelProvider.notifier)
                    .updateWeeklyData(-1); // 前の週に移動
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color:
                  (weekOffset == -3) ? Colors.grey.shade400 : context.mainColor,
            ),
          ),
          const Spacer(),

          ///選択期間のスコア
          Text(
            "${weekDays.first.month}/${weekDays.first.day}〜${weekDays.last.month}/${weekDays.last.day}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: context.width * 0.04),
          ),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.all(context.width * 0.01),
            iconSize: context.width * 0.06,
            onPressed: () {
              if (weekOffset < 0)
                ref.read(dashboardModelProvider.notifier).updateWeeklyData(1);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color:
                  (weekOffset == 0) ? Colors.grey.shade400 : context.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectPeriodTab extends ConsumerWidget {
  const _SelectPeriodTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardAnalyticsProvider);
    final controller = ref.watch(dashboardAnalyticsProvider.notifier);
    final tabs = controller.tabs;
    final initialIndex = tabs.indexOf(state.selectedDayRange);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.002),
      child: Container(
        width: context.width * 0.35,
        height: context.height * 0.035,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: context.mainColor),
        ),
        child: DefaultTabController(
          length: tabs.length,
          initialIndex: initialIndex,
          child: TabBar(
              onTap: (index) => ref
                  .read(dashboardAnalyticsProvider.notifier)
                  .tapTabBar(index),
              labelColor: Colors.white,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.normal),
              unselectedLabelColor: context.mainColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: context.mainColor),
              tabs: [
                Tab(
                  child: Text(
                    "週",
                    style: TextStyle(fontSize: context.width * 0.03),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("月",
                        style: TextStyle(fontSize: context.width * 0.03)),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
