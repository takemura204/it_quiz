import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/dashboard/dashboard_model.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/user/user.model.dart';
import '../../view/chart/weekly_chart.dart';
import '../../view/mission/mission_widget.dart';
import '../../view/rank/rank_widget.dart';
import '../dashboard_analytics_screen/dashboard_analytics_screen.dart';

part 'home_dashboard_daily.dart';

class HomeDashboardScreen extends ConsumerWidget {
  const HomeDashboardScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        // dashboardModelProvider.overrideWith(
        //   (ref) => DashboardModel(ref),
        // ),
      ],
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDashboardScreenProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.1,
        ),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(5),

          ///今日の学習
          DailyDashboard(),

          ///週&月の学習データ
          WeeklyDashboard(),

          ///グループごとの進捗
          GroupProgress(),

          RankScore(),
        ],
      ),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 0,
      title: Text(I18n().titleDashboard),
      centerTitle: true,
      // leading: const RankWidget(),
      // leadingWidth: 125,
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
                context: context, builder: (_) => const DailyMissionWidget());
          },
          icon: Icon(
            LineIcons.clipboardWithCheck,
            size: 32,
            color: context.mainColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
