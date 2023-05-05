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
      height: context.height * 0.3,
      width: context.width * 1,
      // color: Colors.yellow.shade200.withOpacity(0.5),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.01),
      child: BarChartSample(),
    );
  }
}

class BarChartSample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeDashboardScreenProvider).selectedIndex;
    final dataList = ref.watch(homeDashboardScreenProvider.notifier).dataList;
    final maxY = ref.watch(homeDashboardScreenProvider).maxY;

    // 今日の曜日と日付を取得
    final now = DateTime.now();
    final today = now.weekday;
    final startDate = now.subtract(Duration(days: today - 1));

    return Padding(
      padding: EdgeInsets.all(context.width * 0.02),
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
                reservedSize: context.width * 0.05,
                getTitlesWidget: (value, meta) {
                  final color = (value == maxY / 2)
                      ? context.colors.main50.withOpacity(0.6)
                      : Colors.grey;
                  return Text(
                    value.toInt().toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: color),
                  );
                },
              ),
            ),
            // X軸
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: context.height * 0.065,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  final weekdays = [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun'
                  ];
                  final date = startDate.add(Duration(days: index));
                  final monthDay = '${date.month}/${date.day}';
                  final isToday =
                      date.day == now.day && date.month == now.month;

                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 0,
                    child: Column(
                      children: [
                        if (isToday)
                          Container(
                            padding: EdgeInsets.all(context.width * 0.015),
                            decoration: ShapeDecoration(
                                shape: CircleBorder(
                                    side: BorderSide(
                              width: 2,
                              color: context.colors.main50.withOpacity(0.6),
                            ))),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  weekdays[index % 7],
                                  style: TextStyle(
                                      color: (selectedIndex == index)
                                          ? context.colors.main50
                                              .withOpacity(0.6)
                                          : Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: context.width * 0.03),
                                ),
                                Text(
                                  monthDay,
                                  style: TextStyle(
                                    color: (selectedIndex == index)
                                        ? context.colors.main50.withOpacity(0.6)
                                        : Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          Container(
                            padding: EdgeInsets.all(context.width * 0.015),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  weekdays[index % 7],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  monthDay,
                                  style: TextStyle(
                                    color: (selectedIndex == index)
                                        ? context.colors.main50.withOpacity(0.6)
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
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
              final color = (value == maxY / 2)
                  ? context.colors.main50.withOpacity(0.6)
                  : Colors.grey;
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
                (data.value >= 10) ? Color(0xffCC6E6E) : Colors.grey.shade200;

            return BarChartGroupData(
              x: index,
              barRods: [
                CustomBarChartRodData(
                  toY: data.value,
                  color: color,
                  width: 30,
                  borderRadius: BorderRadius.circular(5),
                  icon: data.value >= 10 ? Icons.done : null,
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
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  "${rod.toY}",
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    backgroundColor: rod.color,
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
