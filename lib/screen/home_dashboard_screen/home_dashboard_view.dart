part of 'home_dashboard_screen.dart';

class DashBoardAchievementScreen extends ConsumerWidget {
  const DashBoardAchievementScreen();
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
        children: const [
          Gap(5),

          ///称号レベル
          RankScore(),

          ///デイリーミッション
          DailyMission(),
        ],
      ),
    );
  }
}

class DashBoardAnalyticsScreen extends ConsumerWidget {
  const DashBoardAnalyticsScreen();
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
        children: const [
          Gap(5),

          ///今日の目標
          DailyDashBoard(),

          ///学習状況ダッシュボード
          WeekDashboard(),

          ///グループごとの進捗
          GroupProgress(),
        ],
      ),
    );
  }
}
