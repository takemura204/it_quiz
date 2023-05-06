part of 'home_dashboard_screen.dart';

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

///1週間のデータ
class WeekDashboard extends ConsumerWidget {
  const WeekDashboard();
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
              //項目
              Container(
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
                          fontWeight: FontWeight.normal,
                          fontSize: context.width * 0.03),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const Spacer(),
              //BarChart
              Container(height: context.height * 0.29, child: BarChartSample()),
            ],
          ),
        ),
      ),
    );
  }
}

class BarChartSample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeDashboardScreenProvider).selectedIndex;
    final dataList = ref.watch(homeDashboardScreenProvider.notifier).dataList;
    final goalY = ref.watch(homeDashboardScreenProvider).goalY;
    final maxY = goalY * 2;

    // 今日の曜日と日付を取得
    final now = DateTime.now();
    final today = now.weekday;
    final startDate = now.subtract(Duration(days: today - 1));

    return BarChart(
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
                  textAlign: TextAlign.left,
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
                final isToday = date.day == now.day && date.month == now.month;
                final weekdays =
                    ref.watch(homeDashboardScreenProvider.notifier).weekdays;

                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 2,
                  child: isToday
                      ? Text(
                          "${weekdays[index % 7]} \n $monthDay",
                          style: TextStyle(
                              color: context.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: context.width * 0.03),
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          "${weekdays[index % 7]} \n $monthDay",
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
              strokeWidth: 1,
            );
          },
        ),
        //棒グラフ本体
        barGroups: dataList.asMap().entries.map((e) {
          final index = e.key;
          final data = e.value;
          final color =
              (data.value >= 10) ? context.mainColor : Colors.grey.shade400;

          return BarChartGroupData(
            x: index,
            barRods: [
              CustomBarChartRodData(
                toY: data.value > maxY + 0.5 ? maxY + 0.5 : data.value,
                color: color,
                width: 30,
                borderRadius: BorderRadius.circular(5),
                icon: data.value >= goalY ? Icons.done : null,
              ),
            ],
            showingTooltipIndicators: selectedIndex == index ? [0] : [],
          );
        }).toList(),
        maxY: maxY,
        barTouchData: BarTouchData(
          enabled: true,
          handleBuiltInTouches: false,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.white10,
            tooltipMargin: 0,
            tooltipPadding: const EdgeInsets.all(0),
            tooltipRoundedRadius: 0,
            getTooltipItem: (
              BarChartGroupData group,
              int groupIndex,
              BarChartRodData rod,
              int rodIndex,
            ) {
              final dataValue = dataList[groupIndex].value;
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
    );
  }
}
