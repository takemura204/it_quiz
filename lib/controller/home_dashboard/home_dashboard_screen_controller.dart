import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_dashboard_screen_state.dart';

final homeDashboardScreenProvider = StateNotifierProvider(
  (ref) => HomeDashboardScreenController(ref: ref),
);

class HomeDashboardScreenController
    extends StateNotifier<HomeDashboardScreenState> with LocatorMixin {
  HomeDashboardScreenController({required this.ref})
      : super(HomeDashboardScreenState());

  final Ref ref;

  final dataList = const [
    _BarData(18),
    _BarData(9),
    _BarData(10),
    _BarData(2.5),
    _BarData(2),
    _BarData(9.9),
    _BarData(14),
  ];

  @override
  void initState() {
    super.initState();
  }

  void selectIndex(int selectedIndex) {
    state = state.copyWith(selectedIndex: selectedIndex);
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
  const _BarData(this.value);
  final double value;
}

class CustomBarChartRodData extends BarChartRodData {
  CustomBarChartRodData({
    required double toY,
    required Color color,
    required double width,
    required BorderRadius borderRadius,
    this.icon,
  }) : super(toY: toY, color: color, width: width, borderRadius: borderRadius);

  final IconData? icon;
}
