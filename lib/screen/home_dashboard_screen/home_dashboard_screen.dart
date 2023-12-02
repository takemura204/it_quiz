import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/model/dashboard/dashboard_model.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/lang/initial_resource.dart';
import '../../view/mission/mission_widget.dart';
import '../../view/rank/rank_widget.dart';
import '../dashboard_daily_screen/dashboard_daily_screen.dart';
import '../dashboard_group_progress_screen/dashboard_group_progress_screen.dart';
import '../dashboard_period_screen/dashboard_period_screen.dart';

class HomeDashboardScreen extends ConsumerWidget {
  const HomeDashboardScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        homeDashboardScreenProvider.overrideWith(
          (ref) => HomeDashboardScreenController(ref: ref),
        ),
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
    final model = ref.watch(dashboardModelProvider);
    if (model.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.1,
        ),
      );
    }
    return const SingleChildScrollView(
      child: Column(
        children: [
          Gap(5),

          ///今日の学習
          DailyDashboard(),

          ///週&月の学習データ
          PeriodDashboard(),

          ///グループごとの進捗
          GroupProgressDashboard(),

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
