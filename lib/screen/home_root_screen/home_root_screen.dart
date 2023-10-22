import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/dashboard_analytics/dashboard_analytics_controller.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/auth/auth_controller.dart';
import '../../controller/home_root/home_root_screen_controller.dart';
import '../../controller/home_root/home_root_screen_state.dart';
import '../../model/dashboard/dashboard_model.dart';
import '../../model/lang/initial_resource.dart';
import '../home_dashboard_screen/home_dashboard_screen.dart';
import '../home_quiz_screen/home_quiz_screen.dart';
import '../home_search_screen/home_search_screen.dart';
import '../home_setting_screen/home_setting_screen.dart';

part 'home_root_view.dart';

class HomeRootScreen extends StatelessWidget {
  const HomeRootScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}
