part of '../home_dashboard_screen.dart';

///ダッシュボード
class _BarChartSample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDashboardScreenProvider);
    final selectedIndex = state.selectedXIndex;
    final weeklyIndex = state.weeklyIndex;
    final monthlyIndex = state.monthlyIndex;
    final selectedDayRange = state.selectedDayRange;
    final totalDataList = state.totalDataList;
    final weeklyDataList = state.weeklyDataList[weeklyIndex];
    final monthlyDataList = state.monthlyDataList[monthlyIndex];
    final yearDataList = state.yearDataList;
    final goalY = state.goalY;
    final maxY = goalY * 2;

    return Container(
      height: context.height * 0.29,
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
              final color = (value == goalY) ? context.mainColor : Colors.grey;
              return FlLine(
                color: color,
                strokeWidth: (value == goalY) ? 2 : 1,
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
                      (value == goalY) ? context.mainColor : Colors.grey;
                  return Text(
                    value.toInt().toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: color,
                        fontWeight: (value == goalY)
                            ? FontWeight.bold
                            : FontWeight.normal),
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
                  final state = ref.watch(homeDashboardScreenProvider);
                  switch (state.selectedDayRange) {
                    case 7:
                      return _BottomWeekTitles(meta: meta, value: value);
                    case 31:
                      return _BottomMonthTitles(meta: meta, value: value + 1);
                    case 12:
                      return _BottomYearTitles(meta: meta, value: value);
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
                return weeklyDataList
                    .asMap()
                    .entries
                    .map((e) {
                      final index = e.key;
                      final data = e.value;
                      final color = (data.score >= goalY)
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
                return monthlyDataList
                    .asMap()
                    .entries
                    .map((e) {
                      final index = e.key;
                      final data = e.value;
                      final color = (data.score >= goalY)
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
              case 12:
                return yearDataList
                    .asMap()
                    .entries
                    .map((e) {
                      final index = e.key;
                      final data = e.value;
                      final color = (data.score >= goalY)
                          ? context.mainColor
                          : Colors.grey.shade400;

                      return BarChartGroupData(
                        x: index,
                        barsSpace: 1,
                        barRods: [
                          CustomBarChartRodData(
                            toY: data.score > maxY ? maxY + 1 : data.score,
                            color: color,
                            width: index % 30 == 0 ? 30 : 0, // 1ヶ月ごとに表示
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
                return totalDataList
                    .asMap()
                    .entries
                    .map((e) {
                      final index = e.key;
                      final data = e.value;
                      final color = (data.score >= goalY)
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
                    dataValue = weeklyDataList[groupIndex].score.toInt();
                    break;
                  case 31:
                    dataValue = monthlyDataList[groupIndex].score.toInt();
                    break;
                  case 12:
                    dataValue = state.yearDataList[groupIndex].score.toInt();
                    break;
                  default:
                    dataValue = state.totalDataList[groupIndex].score.toInt();
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
                    .read(homeDashboardScreenProvider.notifier)
                    .selectXIndex(response.spot!.touchedBarGroupIndex);
              } else {
                ref.read(homeDashboardScreenProvider.notifier).selectXIndex(-1);
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
    final state = ref.watch(homeDashboardScreenProvider);
    final selectedIndex = state.selectedXIndex;
    final weeklyIndex = state.weeklyIndex;
    final weekDataList = state.weeklyDataList[weeklyIndex];

    final adjustedIndex = min(max(0, value.toInt()), weekDataList.length - 1);

    final barData = weekDataList[adjustedIndex];
    final isToday = DateTime.now().day == barData.day.day &&
        DateTime.now().weekday == barData.day.weekday;
    final displayText =
        "${barData.weekDay} \n ${barData.day.month}/${barData.day.day}";

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Text(
        displayText,
        style: TextStyle(
          color: isToday ? context.mainColor : Colors.grey,
          fontWeight: (isToday || selectedIndex == adjustedIndex)
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

class _BottomYearTitles extends ConsumerWidget {
  const _BottomYearTitles({required this.meta, required this.value});
  final TitleMeta meta;
  final double value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeDashboardScreenProvider).selectedXIndex;
    final valueIndex = value.toInt();
    final yearDataList = ref.watch(homeDashboardScreenProvider).yearDataList;
    if (valueIndex < 0 || valueIndex >= yearDataList.length) {
      return const SizedBox.shrink();
    }

    final month =
        DateFormat('MMM', 'ja_JP').format(yearDataList[valueIndex].day);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(
        month,
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
