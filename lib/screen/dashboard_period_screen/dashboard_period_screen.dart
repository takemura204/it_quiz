import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_state.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/button/primary_button.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/user/account.model.dart';
import '../screen_argument.dart';

part 'dashboard_chart.dart';

class PeriodDashboard extends ConsumerWidget {
  const PeriodDashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium =
        ref.watch(accountModelProvider.select((x) => x.isPremium));
    return Container(
      width: context.width * 1,
      alignment: Alignment.center,
      child: Card(
        elevation: 1,
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.01, vertical: context.width * 0.01),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
          child: Column(
            children: [
              _Title(
                title: "学習状況",
                subWidget: isPremium ? const _SelectPeriodTab() : const Gap(5),
                icon: Icons.bar_chart_outlined,
              ),
              const Gap(10),
              if (isPremium)
                Column(
                  children: [
                    ///期間
                    const _SelectPeriod(),
                    const Gap(10),

                    const _PeriodData(),

                    const Gap(10),

                    ///ダッシュボード
                    PeriodChart(),

                    const Gap(5),
                  ],
                )
              else
                GestureDetector(
                  onTap: () {
                    context.showScreen(
                        const PremiumDetailScreenArguments().generateRoute());
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/image/dashboard_period_sample.png',
                        color: Colors.white.withOpacity(0.1),
                        colorBlendMode: BlendMode.modulate,
                      ),
                      Container(
                        width: context.width * 0.8,
                        child: Column(
                          children: [
                            const Gap(45),
                            Icon(
                              LineIcons.lock,
                              size: 35,
                              color: context.accentColor,
                            ),
                            const Gap(10),
                            Text(
                              'プレミアムを購入すると\nご利用いただけます',
                              style: TextStyle(
                                color: context.accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Gap(30),
                            PrimaryRoundButton(
                              width: 180,
                              height: 45,
                              text: '購入する',
                              fontSize: 16,
                              onPressed: () {
                                context.showScreen(
                                    const PremiumDetailScreenArguments()
                                        .generateRoute());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
      height: 40,
      margin: EdgeInsets.only(
        left: context.width * 0.02,
        top: context.width * 0.015,
        right: context.width * 0.02,
        bottom: 0.00,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Gap(5),
          Text(
            title,
            style: context.texts.titleMedium,
          ),
          const Spacer(),
          if (subWidget != null) ...[subWidget!],
        ],
      ),
    );
  }
}

class _PeriodData extends ConsumerWidget {
  const _PeriodData();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDashboardScreenProvider);
    final periodQuizCount = state.periodQuizCount;
    final periodDuration = state.periodDuration;
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
            value: periodQuizCount,
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
            value: periodDuration,
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
    final color =
        isSeleted ? context.backgroundColor.withOpacity(0.2) : Colors.white;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(context.width * 0.01),
          child: Card(
            elevation: 0,
            color: color,
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
              borderRadius: BorderRadius.circular(8),
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
                          size: 25,
                        ),
                        Text(
                          "$text",
                          style: context.texts.titleSmall,
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        "$unit",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
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
    );
  }
}

class _SelectPeriod extends ConsumerWidget {
  const _SelectPeriod();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDashboardScreenProvider);
    final weekOffset = state.weekOffset;
    final monthOffset = state.monthOffset;
    final periodDays = state.periodDays;
    final selectedPeriodType = state.selectedPeriodType;

    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.all(context.width * 0.01),
            iconSize: 21,
            onPressed: () {
              if (selectedPeriodType == PeriodType.weekly && weekOffset > -2) {
                ref
                    .read(homeDashboardScreenProvider.notifier)
                    .updatePeriodData(-1);
              } else if (selectedPeriodType == PeriodType.monthly &&
                  monthOffset > -2) {
                ref
                    .read(homeDashboardScreenProvider.notifier)
                    .updatePeriodData(-1);
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
                ? "${periodDays.first.month}/${periodDays.first.day} 〜 ${periodDays.last.month}/${periodDays.last.day}"
                : "${periodDays.first.year}/${periodDays.first.month}/${periodDays.first.day} 〜 ${periodDays.first.year}/${periodDays.last.month}/${periodDays.last.day}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.all(context.width * 0.01),
            iconSize: 21,
            onPressed: () {
              if (selectedPeriodType == PeriodType.weekly && weekOffset < 0) {
                ref
                    .read(homeDashboardScreenProvider.notifier)
                    .updatePeriodData(1);
              } else if (selectedPeriodType == PeriodType.monthly &&
                  monthOffset < 0) {
                ref
                    .read(homeDashboardScreenProvider.notifier)
                    .updatePeriodData(1);
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
        width: 150,
        height: 30,
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
              tabs: const [
                Tab(
                  child: Text(
                    "週",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("月", style: TextStyle(fontSize: 14)),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
