part of 'home_dashboard_screen.dart';

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
          DailyStatus(),

          WeeklyDashboard(),

          ///学習状況ダッシュボード
          DashboardQuizLength(),

          ///今日の目標
          // DailyGoal(),

          ///グループごとの進捗
          GroupProgress(),

          RankScore(),
        ],
      ),
    );
  }
}
