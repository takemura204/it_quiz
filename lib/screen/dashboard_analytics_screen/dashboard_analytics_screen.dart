import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/bar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../controller/dashboard_analytics/bar_data_state.dart';
import '../../controller/dashboard_analytics/dashboard_analytics_controller.dart';
import '../../controller/quiz_item/quiz_item_controller.dart';

part 'dashboard_analytics_view.dart';

class DashBoardAnalyticsScreen extends ConsumerWidget {
  const DashBoardAnalyticsScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Gap(5),

          ///今日のデータ
          _DailyDashBoard(),

          ///学習状況ダッシュボード
          _WeekDashboard(),

          ///グループごとの進捗
          _GroupProgress(),
        ],
      ),
    );
  }
}

///今日の学習問題数
class _DailyDashBoard extends ConsumerWidget {
  const _DailyDashBoard();
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
    final dailyGoal = state.dailyGoal;
    return Container(
      height: context.height * 0.22,
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
        child: Row(
          children: [
            const Spacer(),

            ///チャート
            ProgressRangeChart(
              width: context.height * 0.2,
              size: context.height * 0.2,
              maxScore: dailyGoal,
              currentScore: dailyScore,
              widget: Column(
                children: [
                  const Spacer(),
                  Text(
                    "今日の\n学習問題数",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: context.height * 0.015,
                      height: 1.2,
                    ),
                  ),
                  Text(
                    "$dailyScore",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.height * 0.045,
                      color: context.mainColor,
                    ),
                  ),
                  Text(
                    "/$dailyGoal",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.height * 0.015,
                      color: context.mainColor,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),

            ///今日の一言
            const _DailyMessage(),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

///1週間のデータ
class _WeekDashboard extends ConsumerWidget {
  const _WeekDashboard();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardAnalyticsProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.35,
        ),
      );
    }
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
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.01, vertical: context.width * 0.01),
          child: Column(
            children: [
              ///X軸範囲
              const _SelectDayLength(),

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

///ダッシュボード
class _BarChartSample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardAnalyticsProvider);
    final selectedIndex = state.selectedXIndex;
    final weeklyIndex = state.weeklyIndex;
    final monthlyIndex = state.monthlyIndex;
    final selectedDayRange = state.selectedDayRange;
    final totalData = state.totalData;
    final weeklyData = state.weeklyData[weeklyIndex];
    final monthlyData = state.monthlyData[monthlyIndex];
    final dailyGoal = state.dailyGoal;
    final maxY = dailyGoal * 2;

    return Container(
      height: context.height * 0.25,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,

          ///ボーダー
          borderData: FlBorderData(
            show: true,
            border: const Border.symmetric(
              horizontal: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),

          ///グリッド線
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              final color =
                  (value == dailyGoal) ? context.mainColor : Colors.grey;
              return FlLine(
                color: color,
                strokeWidth: (value == dailyGoal) ? 2 : 1,
              );
            },
          ),

          ///タイトル
          titlesData: FlTitlesData(
            show: true,

            ///Y軸
            leftTitles: AxisTitles(
              drawBehindEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final color =
                      (value == dailyGoal) ? context.mainColor : Colors.grey;
                  final fontSize = (value == 100)
                      ? context.width * 0.025
                      : context.width * 0.03;
                  return Text(
                    value.toInt().toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontSize: fontSize,
                      fontWeight: (value == dailyGoal)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  );
                },
              ),
            ),

            /// X軸
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: context.height * 0.04,
                getTitlesWidget: (value, meta) {
                  final state = ref.watch(dashboardAnalyticsProvider);
                  switch (state.selectedDayRange) {
                    case 7:
                      return _BottomWeekTitles(meta: meta, value: value);
                    case 31:
                      return _BottomMonthTitles(meta: meta, value: value + 1);

                    default:
                      return _BottomWeekTitles(meta: meta, value: value);
                  }
                },
              ),
            ),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
          ),

          /// グラフ本体
          barGroups: (() {
            switch (selectedDayRange) {
              case 7:
                return weeklyData
                    .asMap()
                    .entries
                    .map((e) {
                      final index = e.key;
                      final data = e.value;
                      final color = (data.score >= dailyGoal)
                          ? context.mainColor
                          : Colors.grey.shade400;

                      return BarChartGroupData(
                        x: index,
                        barsSpace: 1,
                        barRods: [
                          CustomBarChartRodData(
                            toY: data.score > maxY ? maxY + 1 : data.score,
                            color: color,
                            width: 30,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ],
                        showingTooltipIndicators:
                            selectedIndex == index ? [0] : [],
                      );
                    })
                    .whereType<BarChartGroupData>()
                    .toList();
              case 31:
                return monthlyData
                    .asMap()
                    .entries
                    .map((e) {
                      final index = e.key;
                      final data = e.value;
                      final color = (data.score >= dailyGoal)
                          ? context.mainColor
                          : Colors.grey.shade400;

                      return BarChartGroupData(
                        x: index,
                        barsSpace: 1,
                        barRods: [
                          CustomBarChartRodData(
                            toY: data.score > maxY ? maxY + 1 : data.score,
                            color: color,
                            width: 10, // 月間データのときは棒グラフの幅を10にする
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ],
                        showingTooltipIndicators:
                            selectedIndex == index ? [0] : [],
                      );
                    })
                    .whereType<BarChartGroupData>()
                    .toList();
              default:
                return totalData
                    .asMap()
                    .entries
                    .map((e) {
                      final index = e.key;
                      final data = e.value;
                      final color = (data.score >= dailyGoal)
                          ? context.mainColor
                          : Colors.grey.shade400;

                      return BarChartGroupData(
                        x: index,
                        barsSpace: 1,
                        barRods: [
                          CustomBarChartRodData(
                            toY: data.score > maxY ? maxY + 1 : data.score,
                            color: color,
                            width: 30, // すべてのデータを表示するように変更
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ],
                        showingTooltipIndicators:
                            selectedIndex == index ? [0] : [],
                      );
                    })
                    .whereType<BarChartGroupData>()
                    .toList();
            }
          })(),

          maxY: maxY.toDouble(),
          barTouchData: BarTouchData(
            enabled: true,
            handleBuiltInTouches: false,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.white10,
              tooltipMargin: -5,
              tooltipPadding: const EdgeInsets.all(0),
              tooltipRoundedRadius: 0,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                int dataValue;
                switch (state.selectedDayRange) {
                  case 7:
                    dataValue = weeklyData[groupIndex].score.toInt();
                    break;
                  case 31:
                    dataValue = monthlyData[groupIndex].score.toInt();
                    break;
                  default:
                    dataValue = totalData[groupIndex].score.toInt();
                    break;
                }
                return BarTooltipItem(
                  "$dataValue",
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: rod.color,
                    backgroundColor: Colors.transparent,
                    fontSize: context.width * 0.04,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
            touchCallback: (event, response) {
              if (event.isInterestedForInteractions &&
                  response != null &&
                  response.spot != null) {
                ref
                    .read(dashboardAnalyticsProvider.notifier)
                    .selectXIndex(response.spot!.touchedBarGroupIndex);
              } else {
                ref.read(dashboardAnalyticsProvider.notifier).selectXIndex(-1);
              }
            },
          ),
        ),
      ),
    );
  }
}

class _BottomWeekTitles extends ConsumerWidget {
  const _BottomWeekTitles({required this.meta, required this.value});
  final TitleMeta meta;
  final double value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardAnalyticsProvider);
    final selectedXIndex = state.selectedXIndex;
    final weeklyIndex = state.weeklyIndex;
    final weekData = state.weeklyData[weeklyIndex];
    final adjustedIndex = min(max(0, value.toInt()), weekData.length - 1);
    final barData = weekData[adjustedIndex];
    final isToday = DateTime.now().day == barData.day.day &&
        DateTime.now().weekday == barData.day.weekday;
    final displayText =
        "${barData.day.month}/${barData.day.day}\n${barData.weekDay}";

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Text(
        displayText,
        style: TextStyle(
          color: isToday ? context.mainColor : Colors.grey,
          fontWeight: (isToday || selectedXIndex == adjustedIndex)
              ? FontWeight.bold
              : FontWeight.normal,
          fontSize: context.width * 0.03,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _BottomMonthTitles extends ConsumerWidget {
  const _BottomMonthTitles({required this.meta, required this.value});
  final TitleMeta meta;
  final double value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeDashboardScreenProvider).selectedXIndex;
    final valueIndex = value.toInt();
    final monthDay = '$valueIndex';

    if (valueIndex % 5 != 1) {
      return const SizedBox.shrink();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Text(
        monthDay,
        style: TextStyle(
          color: (selectedIndex == valueIndex) ? Colors.black54 : Colors.grey,
          fontSize: context.width * 0.03,
          fontWeight: (selectedIndex == valueIndex)
              ? FontWeight.bold
              : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
