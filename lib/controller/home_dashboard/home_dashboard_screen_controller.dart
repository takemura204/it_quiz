import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_dashboard_screen_state.dart';

final homeDashboardScreenProvider = StateNotifierProvider<
    HomeDashboardScreenController, HomeDashboardScreenState>(
  (ref) => HomeDashboardScreenController(ref: ref),
);

class HomeDashboardScreenController
    extends StateNotifier<HomeDashboardScreenState> with LocatorMixin {
  HomeDashboardScreenController({required this.ref})
      : super(const HomeDashboardScreenState());

  final Ref ref;
  late List<_BarData> weekDataList = [
    _BarData(30, "Mon"),
    _BarData(9, "Tue"),
    _BarData(10, "Wed"),
    _BarData(2, "Thu"),
    _BarData(2, "Fri"),
    _BarData(9, "Sat"),
    _BarData(14, "Sun"),
  ];
  final now = DateTime.now();
  final todayIndex = DateTime.now().weekday - 1;

  @override
  void initState() {
    super.initState();
  }

  void selectIndex(int selectedIndex) {
    state = state.copyWith(selectedIndex: selectedIndex);
  }

  void setGoalY(int index) {
    if (index >= 10 && index <= 50) {
      state = state.copyWith(goalY: index);
    }
  }

  void setTodayData(int value) {
    final weekList = [...weekDataList];
    final newValue = weekList[todayIndex].value + value;
    weekList[todayIndex] = _BarData(newValue, weekDataList[todayIndex].weekDay);

    state = state.copyWith(dayScore: newValue);
    print(newValue);
    print(weekDataList[todayIndex].value);
  }

  BarChartGroupData generateBarGroup(int x, Color color, double value) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 30, // 棒グラフの太さ
          borderRadius: BorderRadius.circular(5),
        ),
      ],
      showingTooltipIndicators: state.selectedIndex == x ? [0] : [],
    );
  }
}

class _BarData {
  const _BarData(this.value, this.weekDay);
  final int value;
  final String weekDay;
}

class CustomBarChartRodData extends BarChartRodData {
  CustomBarChartRodData({
    required int toY,
    required Color color,
    required double width,
    required BorderRadius borderRadius,
    this.icon,
  }) : super(
            toY: toY.toDouble(),
            color: color,
            width: width,
            borderRadius: borderRadius);

  final IconData? icon;
}
