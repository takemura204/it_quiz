part of 'home_dashboard_screen.dart';

class _TodayData extends ConsumerWidget {
  const _TodayData();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dayScore = ref.watch(homeDashboardScreenProvider).dayScore;
    return Container(
      height: context.height * 0.1,
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
            Text(
              "今日のデータ",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: context.width * 0.04,
              ),
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.all(context.width * 0.01),
              iconSize: context.width * 0.08,
              onPressed: dayScore <= 10
                  ? null
                  : () {
                      ref
                          .read(homeDashboardScreenProvider.notifier)
                          .setTodayData(dayScore - 1);
                    },
              icon: Icon(
                Icons.remove_circle_outline,
                color:
                    dayScore <= 10 ? Colors.grey.shade400 : context.mainColor,
              ),
            ),
            Text(
              "$dayScore",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: context.width * 0.05),
            ),
            Text(
              "操作",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: context.width * 0.04),
            ),
            IconButton(
              padding: EdgeInsets.all(context.width * 0.01),
              iconSize: context.width * 0.08,
              onPressed: dayScore >= 50
                  ? null
                  : () {
                      ref
                          .read(homeDashboardScreenProvider.notifier)
                          .setTodayData(dayScore + 1);
                    },
              icon: Icon(
                Icons.add_circle_outline,
                color:
                    dayScore >= 50 ? Colors.grey.shade400 : context.mainColor,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

///毎日の目標設定
class _SetGoalY extends ConsumerWidget {
  const _SetGoalY();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalY = ref.watch(homeDashboardScreenProvider).goalY;
    return Container(
      height: context.height * 0.1,
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
            Text(
              "毎日の目標",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: context.width * 0.04,
              ),
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.all(context.width * 0.01),
              iconSize: context.width * 0.08,
              onPressed: goalY <= 10
                  ? null
                  : () {
                      ref
                          .read(homeDashboardScreenProvider.notifier)
                          .setGoalY(goalY - 10);
                      print("a");
                    },
              icon: Icon(
                Icons.remove_circle_outline,
                color: goalY <= 10 ? Colors.grey.shade400 : context.mainColor,
              ),
            ),
            Text(
              "$goalY",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: context.width * 0.05),
            ),
            Text(
              "問",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: context.width * 0.04),
            ),
            IconButton(
              padding: EdgeInsets.all(context.width * 0.01),
              iconSize: context.width * 0.08,
              onPressed: goalY >= 50
                  ? null
                  : () {
                      ref
                          .read(homeDashboardScreenProvider.notifier)
                          .setGoalY(goalY + 10);
                    },
              icon: Icon(
                Icons.add_circle_outline,
                color: goalY >= 50 ? Colors.grey.shade400 : context.mainColor,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

///ダッシュボード
class _BarChartSample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeDashboardScreenProvider).selectedIndex;
    final weekDataList =
        ref.watch(homeDashboardScreenProvider.notifier).weekDataList;
    final goalY = ref.watch(homeDashboardScreenProvider).goalY;
    final maxY = goalY * 2;

    // 今日の曜日と日付を取得
    final now = DateTime.now();
    final today = now.weekday;
    final startDate = now.subtract(Duration(days: today - 1));

    return Container(
      height: context.height * 0.29,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          //ボーダー
          borderData: FlBorderData(
            show: true,
            border: const Border.symmetric(
              horizontal: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
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
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  final date = startDate.add(Duration(days: index));
                  final monthDay = '${date.month}/${date.day}';
                  final isToday =
                      date.day == now.day && date.month == now.month;
                  final weekDataList = ref
                      .watch(homeDashboardScreenProvider.notifier)
                      .weekDataList;

                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 2,
                    child: isToday
                        ? Text(
                            "${weekDataList[index % 7].weekDay} \n $monthDay",
                            style: TextStyle(
                                color: context.mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: context.width * 0.03),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            "${weekDataList[index % 7].weekDay} \n $monthDay",
                            style: TextStyle(
                              color: (selectedIndex == index)
                                  ? Colors.black54
                                  : Colors.grey,
                              fontSize: context.width * 0.03,
                              fontWeight: (selectedIndex == index)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
          ),
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
          //棒グラフ本体
          barGroups: weekDataList.asMap().entries.map((e) {
            final index = e.key;
            final data = e.value;
            final color = (data.value >= goalY)
                ? context.mainColor
                : Colors.grey.shade400;

            return BarChartGroupData(
              x: index,
              barsSpace: 1,
              barRods: [
                CustomBarChartRodData(
                  toY: data.value > maxY ? maxY + 1 : data.value,
                  color: color,
                  width: 30,
                  borderRadius: BorderRadius.circular(5),
                  icon: data.value >= goalY ? Icons.done : null,
                ),
              ],
              showingTooltipIndicators: selectedIndex == index ? [0] : [],
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
                final dataValue = weekDataList[groupIndex].value.toInt();
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
                    .selectIndex(response.spot!.touchedBarGroupIndex);
              } else {
                ref.read(homeDashboardScreenProvider.notifier).selectIndex(-1);
              }
            },
          ),
        ),
      ),
    );
  }
}

///凡例
class _Legend extends ConsumerWidget {
  const _Legend();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.025,
      child: Row(
        children: [
          const Spacer(),
          Icon(
            Icons.circle,
            size: context.width * 0.035,
            color: context.mainColor,
          ),
          Text(
            "達成",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: context.width * 0.03,
            ),
          ),
          const Gap(10),
          Icon(
            Icons.circle,
            size: context.width * 0.035,
            color: Colors.grey.shade400,
          ),
          Text(
            "未達成",
            style: TextStyle(
                fontWeight: FontWeight.normal, fontSize: context.width * 0.03),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
