part of '../home_dashboard_screen.dart';

///ダッシュボード
class _BarChartSample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDashboardScreenProvider);
    final selectedIndex = state.selectedXIndex;
    final selectedDayRange = state.selectedDayRange;
    final totalDataList = state.totalDataList;
    final weeklyDataList = state.weeklyDataList;
    final monthlyDataList = state.monthlyDataList;
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
            //Y軸
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
            // X軸
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: context.height * 0.04,
                getTitlesWidget: (value, meta) =>
                    _BottomTitles(meta: meta, value: value),
              ),
            ),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
          ),

          /// グラフ本体
          barGroups:
              // 週間データの処理
              selectedDayRange == 7
                  ? weeklyDataList.asMap().entries.map((e) {
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
                    }).toList()
                  : selectedDayRange == 31
                      // 月間データの処理
                      ? monthlyDataList.asMap().entries.map((e) {
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
                        }).toList()
                      : totalDataList.asMap().entries.map((e) {
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
                        }).toList(),
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
                final dataValue = totalDataList[groupIndex].score.toInt();
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

class _BottomTitles extends ConsumerWidget {
  const _BottomTitles({required this.meta, required this.value});
  final TitleMeta meta;
  final double value;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDashboardScreenProvider);
    final selectedIndex = state.selectedXIndex;
    final valueIndex = value.toInt();
    final now = DateTime.now();
    final today = now.weekday;
    final startDate = now.subtract(Duration(days: today - 1));
    final date = startDate.add(Duration(days: valueIndex));
    final monthDay = '${date.month}/${date.day}';
    final isToday = date.day == now.day && date.month == now.month;
    final weekDataList = ref.watch(homeDashboardScreenProvider).totalDataList;

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: isToday
          ? Text(
              "${weekDataList[valueIndex % 7].weekDay} \n $monthDay",
              style: TextStyle(
                  color: context.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: context.width * 0.03),
              textAlign: TextAlign.center,
            )
          : Text(
              "${weekDataList[valueIndex % 7].weekDay} \n $monthDay",
              style: TextStyle(
                color: (selectedIndex == valueIndex)
                    ? Colors.black54
                    : Colors.grey,
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
