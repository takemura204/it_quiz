import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/controller/home_quiz/home_quiz_screen_controller.dart';
import 'package:kentei_quiz/model/dashboard/dashboard_model.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/auth/auth_controller.dart';
import '../../controller/home_root/home_root_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../home_dashboard_screen/home_dashboard_screen.dart';
import '../home_quiz_screen/home_quiz_screen.dart';
import '../home_search_screen/home_search_screen.dart';
import '../home_setting_screen/home_setting_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: _Body(),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeRootScreenControllerProvider);

    return IndexedStack(
      sizing: StackFit.expand,
      index: state.currentIndex,
      children: const [
        HomeQuizScreen(),
        HomeSearchScreen(),
        HomeDashboardScreen(),
        HomeSettingScreen(),
      ],
    );
  }
}

class _BottomNavBar extends ConsumerWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeRootScreenControllerProvider);

    return BottomNavigationBar(
        elevation: 300,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(LineIcons.list),
            activeIcon: const Icon(LineIcons.list),
            label: I18n().titleQuiz,
          ),
          BottomNavigationBarItem(
            icon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(math.pi),
              child: const Icon(LineIcons.search),
            ),
            activeIcon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(math.pi),
              child: const Icon(LineIcons.search),
            ),
            label: I18n().titleSearch,
          ),
          BottomNavigationBarItem(
            icon: const Icon(LineIcons.barChartAlt),
            activeIcon: const Icon(LineIcons.barChartAlt),
            label: I18n().titleDashboard,
          ),
          BottomNavigationBarItem(
            icon: const Icon(LineIcons.cog),
            activeIcon: const Icon(LineIcons.cog),
            label: I18n().titleSetting,
          ),
        ],
        currentIndex: state.currentIndex,
        fixedColor: context.mainColor,
        onTap: (index) async {
          ref
              .watch(homeRootScreenControllerProvider.notifier)
              .changeTabIndex(index);

          if (index == 2) {
            ref.read(dashboardModelProvider.notifier).initState();
            ref.read(homeDashboardScreenProvider.notifier).initState();
            ref.read(homeQuizScreenProvider.notifier).loadCategoryList();
          }
          if (index == 3) {
            ref.read(authProvider.notifier).initState();
          }
        });
  }
}