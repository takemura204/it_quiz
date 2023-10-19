import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/user.model.dart';

import '../../model/dashboard/dashboard_model.dart';

class WeeklyDurationChart extends ConsumerWidget {
  const WeeklyDurationChart();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider).userCustom;
    final dailyDurationGoal = userModel.dailyDurationGoal.inMinutes; //目標値
    final limitMemory = dailyDurationGoal * 2; //最大表示メモリ

    final model = ref.watch(dashboardModelProvider);
    final weekDays = model.weekDays;
    final weeklyDuration = model.weeklyDuration;

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
              final color = (value == dailyDurationGoal)
                  ? context.mainColor
                  : Colors.grey;
              return FlLine(
                color: color,
                strokeWidth: (value == dailyDurationGoal) ? 3 : 1,
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
                reservedSize: context.width * 0.07,
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final color = (value == dailyDurationGoal)
                      ? context.mainColor
                      : Colors.grey;
                  final fontSize = (value == 100)
                      ? context.width * 0.025
                      : context.width * 0.03;
                  return Text(
                    "${value.toInt()}m",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontSize: fontSize,
                      fontWeight: (value == dailyDurationGoal)
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
                        fontWeight: FontWeight.bold,
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
            // 上軸
            topTitles: AxisTitles(),
          ),

          /// グラフ本体
          barGroups: weekDays.map((day) {
            final duration = weeklyDuration[weekDays.indexOf(day)].inMinutes;
            final color = (duration >= dailyDurationGoal)
                ? context.mainColor
                : Colors.grey.shade400;

            return BarChartGroupData(
              x: weekDays.indexOf(day),
              barsSpace: 1,
              barRods: [
                CustomBarChartRodData(
                  toY: duration > limitMemory
                      ? limitMemory + 0.5
                      : duration.toDouble(),
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
                final int dataValue = weeklyDuration[group.x].inMinutes;
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
          ),
        ),
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
