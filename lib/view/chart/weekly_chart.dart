import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_state.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/dashboard/dashboard_model.dart';
import 'chart.dart';

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
                subWidget: _SelectPeriodTab(),
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
                  ],
                ),
              ),

              Gap(context.height * 0.01),

              const _TotalData(),

              Gap(context.height * 0.01),

              ///ダッシュボード
              QuizChart(),

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
    final weeklyDurationTotal = model.weeklyDurationTotal;
    final state = ref.watch(homeDashboardScreenProvider);
    final selectedChartType = state.selectedChartType;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _StatusCard(
            text: "問題数",
            value: weeklyQuizTotal,
            icon: LineIcons.book,
            unit: "問",
            isSeleted: selectedChartType == ChartType.quizCount,
            onTap: () {
              ref
                  .read(homeDashboardScreenProvider.notifier)
                  .setSelectedChartType(ChartType.quizCount);
            },
          ),
          _StatusCard(
            text: "学習時間",
            value: weeklyDurationTotal,
            icon: LineIcons.clock,
            unit: "分",
            isSeleted: selectedChartType == ChartType.duration,
            onTap: () {
              ref
                  .read(homeDashboardScreenProvider.notifier)
                  .setSelectedChartType(ChartType.duration);
            },
          ),
        ],
      ),
    );
  }
}

class _StatusCard extends ConsumerWidget {
  const _StatusCard(
      {required this.value,
      required this.text,
      required this.icon,
      required this.unit,
      required this.isSeleted,
      required this.onTap});

  final int value;
  final String text;
  final IconData icon;
  final String unit;
  final bool isSeleted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = isSeleted ? context.mainColor : Colors.black54;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(context.width * 0.01),
          child: Container(
            width: context.width * 0.27,
            child: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: isSeleted
                    ? BorderSide(
                        color: context.mainColor,
                        width: 1.5,
                      )
                    : BorderSide(
                        color: Colors.grey.shade200,
                        width: 1,
                      ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.width * 0.02),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            color: color,
                            size: context.width * 0.06,
                          ),
                          Text(
                            "$text",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: color,
                                fontSize: context.width * 0.035),
                          ),
                        ],
                      ),
                    ),
                  ),
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
          ),
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
    final monthOffset = model.monthOffset;
    final weekDays = model.weekDays;

    final state = ref.watch(homeDashboardScreenProvider);
    final selectedPeriodType = state.selectedPeriodType;

    return Expanded(
      child: Container(
        width: context.width * 0.55,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.all(context.width * 0.01),
              iconSize: context.width * 0.06,
              onPressed: () {
                if (selectedPeriodType == PeriodType.weekly &&
                    weekOffset > -2) {
                  ref
                      .read(dashboardModelProvider.notifier)
                      .updateWeeklyData(-1);
                } else if (selectedPeriodType == PeriodType.monthly &&
                    monthOffset > -2) {
                  ref
                      .read(dashboardModelProvider.notifier)
                      .updateWeeklyData(-1);
                }
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: (((selectedPeriodType == PeriodType.weekly) &&
                            weekOffset > -2) ||
                        ((selectedPeriodType == PeriodType.monthly) &&
                            monthOffset > -2))
                    ? context.mainColor
                    : Colors.grey.shade400,
              ),
            ),
            const Spacer(),

            ///選択期間のスコア
            Text(
              (selectedPeriodType == PeriodType.weekly)
                  ? "${weekDays.first.month}/${weekDays.first.day} 〜 ${weekDays.last.month}/${weekDays.last.day}"
                  : "${weekDays.first.year}/${weekDays.first.month}/${weekDays.first.day} 〜 ${weekDays.first.year}/${weekDays.last.month}/${weekDays.last.day}",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: context.width * 0.04),
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.all(context.width * 0.01),
              iconSize: context.width * 0.06,
              onPressed: () {
                if (selectedPeriodType == PeriodType.weekly && weekOffset < 0) {
                  ref.read(dashboardModelProvider.notifier).updateWeeklyData(1);
                } else if (selectedPeriodType == PeriodType.monthly &&
                    monthOffset < 0) {
                  ref.read(dashboardModelProvider.notifier).updateWeeklyData(1);
                }
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: ((selectedPeriodType == PeriodType.weekly &&
                            weekOffset < 0) ||
                        (selectedPeriodType == PeriodType.monthly &&
                            monthOffset < 0))
                    ? context.mainColor
                    : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectPeriodTab extends ConsumerWidget {
  const _SelectPeriodTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(homeDashboardScreenProvider).tabIndex;
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
          length: 2,
          initialIndex: tabIndex,
          child: TabBar(
              onTap: (index) {
                ref
                    .read(homeDashboardScreenProvider.notifier)
                    .setSelectedPeriodType(index);
              },
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
