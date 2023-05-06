import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';

import '../../controller/home_dashboard/home_dashboard_screen_controller.dart';

part 'home_dashboard_view.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          _DailyMission(),
          _TotalScore(),
          WeekDashboard(),
        ],
      ),
    );
  }
}
