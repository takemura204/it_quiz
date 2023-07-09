import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/screen/dashboard_analytics_screen/dashboard_analytics_screen.dart';

import '../../resource/lang/initial_resource.dart';
import '../dashboard_achievement_screen/dashboard_achievement_screen.dart';

part 'home_dashboard_view.dart';

class HomeDashboardScreen extends ConsumerWidget {
  const HomeDashboardScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = ref.watch(homeDashboardScreenProvider.notifier).tabs;

    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: tabs.length, // タブの数
      child: const Scaffold(
        appBar: _AppBar(),
        body: TabBarView(
          children: [
            DashBoardAchievementScreen(),
            DashBoardAnalyticsScreen(),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = ref.watch(homeDashboardScreenProvider.notifier).tabs;

    return AppBar(
      title: Text(I18n().titleDashboard),
      bottom: TabBar(
          onTap: (index) =>
              ref.read(homeDashboardScreenProvider.notifier).tapTabBar(index),
          labelColor: context.mainColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          unselectedLabelColor: Colors.black45.withOpacity(0.3),
          tabs: [
            Tab(
              child: Container(
                width: context.width * 0.5,
                alignment: Alignment.center,
                child: Text(
                  "${tabs[0]}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.04),
                ),
              ),
            ),
            Tab(
              child: Container(
                width: context.width * 0.5,
                alignment: Alignment.center,
                child: Text(
                  "${tabs[1]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * 0.04,
                  ),
                ),
              ),
            ),
          ]),
      shape: Border(bottom: BorderSide(color: context.mainColor, width: 0)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
