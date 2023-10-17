import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/user.model.dart';

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
                title: "7日の記録",
                subWidget: null,
                icon: Icons.bar_chart_outlined,
              ),

              Gap(context.height * 0.01),

              ///期間
              const _SelectPeriod(),

              Gap(context.height * 0.01),

              ///ダッシュボード
              WeeklyChart(),
              Gap(context.height * 0.005),
            ],
          ),
        ),
      ),
    );
  }
}

class WeeklyChart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider).userCustom;
    final dailyQuizCountGoal = userModel.dailyQuizCountGoal; //目標値
    final limitMemory = dailyQuizCountGoal * 2; //最大表示メモリ

    final model = ref.watch(dashboardModelProvider);
    final weekDays = model.weekDays;
    final weeklyQuizCounts = model.weeklyQuizCounts;

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
              final color = (value == dailyQuizCountGoal)
                  ? context.mainColor
                  : Colors.grey;
              return FlLine(
                color: color,
                strokeWidth: (value == dailyQuizCountGoal) ? 3 : 1,
              );
            },
          ),

          ///メモリ
          titlesData: FlTitlesData(
            show: true,
            //左軸
            leftTitles: AxisTitles(
              drawBehindEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final color = (value == dailyQuizCountGoal)
                      ? context.mainColor
                      : Colors.grey;
                  final fontSize = (value == 100)
                      ? context.width * 0.025
                      : context.width * 0.03;
                  return Text(
                    "${value.toInt()}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontSize: fontSize,
                      fontWeight: (value == dailyQuizCountGoal)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  );
                },
              ),
            ),
            // 下軸
            bottomTitles: AxisTitles(
              drawBehindEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: context.height * 0.04,
                getTitlesWidget: (value, meta) {
                  final date = weekDays[value.toInt()];
                  final isToday = DateTime.now().day == date.day &&
                      DateTime.now().weekday == date.weekday;
                  final formattedDate = "${date.month}/${date.day}";
                  return Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      formattedDate,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight:
                            isToday ? FontWeight.bold : FontWeight.normal,
                        color:
                            isToday ? context.mainColor : Colors.grey.shade400,
                        fontSize: context.width * 0.03,
                      ),
                    ),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
          ),

          /// グラフ本体
          barGroups: weekDays.map((day) {
            final quizCount = weeklyQuizCounts[weekDays.indexOf(day)];
            final color = (quizCount >= dailyQuizCountGoal)
                ? context.mainColor
                : Colors.grey.shade400;

            return BarChartGroupData(
              x: weekDays.indexOf(day),
              barsSpace: 1,
              barRods: [
                CustomBarChartRodData(
                  toY: quizCount > limitMemory
                      ? limitMemory + 0.5
                      : quizCount.toDouble(),
                  color: color,
                  width: 30,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
              showingTooltipIndicators: [],
            );
          }).toList(),
          maxY: limitMemory.toDouble(),
          barTouchData: BarTouchData(
            enabled: true,
            handleBuiltInTouches: true,
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
                final int dataValue = weeklyQuizCounts[group.x];
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
                    .read(dashboardModelProvider.notifier)
                    .selectXIndex(response.spot!.touchedBarGroupIndex);
              } else {
                ref.read(dashboardModelProvider.notifier).selectXIndex(-1);
              }
            },
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
    final weekDays = model.weekDays;
    final weeklyQuizTotal = model.weeklyQuizTotal;

    return Container(
      height: context.height * 0.04,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.01),
      child: Row(
        children: [
          Gap(context.width * 0.02),

          ///アイコン欲しい
          Text(
            "計${weeklyQuizTotal}問",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: context.width * 0.05),
          ),

          const Spacer(),

          ///期間
          Container(
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
                    color: (weekOffset == -3)
                        ? Colors.grey.shade400
                        : context.mainColor,
                  ),
                ),
                const Spacer(),

                ///選択期間のスコア
                Text(
                  "${weekDays.first.month}/${weekDays.first.day}〜${weekDays.last.month}/${weekDays.last.day}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.04),
                ),
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.all(context.width * 0.01),
                  iconSize: context.width * 0.06,
                  onPressed: () {
                    if (weekOffset <= 0)
                      ref
                          .read(dashboardModelProvider.notifier)
                          .updateWeeklyData(1);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: (weekOffset == 0)
                        ? Colors.grey.shade400
                        : context.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBarChartRodData extends BarChartRodData {
  CustomBarChartRodData({
    required double toY,
    required Color color,
    required double width,
    required BorderRadius borderRadius,
  }) : super(toY: toY, color: color, width: width, borderRadius: borderRadius);
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
