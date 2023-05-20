import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/screen/dashboard_analytics_screen/dashboard_analytics_screen.dart';

import '../../resource/lang/initial_resource.dart';

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
            DashBoardAnalyticsScreen(),
            _DashBoardRankScreen(),
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
      title: Text(I18n().titleTest),
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

class _DashBoardRankScreen extends ConsumerWidget {
  const _DashBoardRankScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Gap(5),

          ///デイリーミッション
          _DailyMission(),

          ///詳細
          _TotalScore(),
        ],
      ),
    );
  }
}

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
