import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../model/lang/initial_resource.dart';
import '../dashboard_daily_screen/dashboard_daily_screen.dart';
import '../dashboard_period_screen/dashboard_period_screen.dart';
import '../dashboard_progress_screen/dashboard_group_screen.dart';

class HomeDashboardScreen extends ConsumerWidget {
  const HomeDashboardScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
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
    return const SingleChildScrollView(
      child: Column(
        children: [
          Gap(5),

          ///今日の学習
          DailyDashboard(),

          ///学習状況
          PeriodDashboard(),

          ///進捗状況
          GroupProgressDashboards(),
          Gap(5),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
