part of 'home_dashboard_screen.dart';

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
    return const SingleChildScrollView(
      child: Column(
        children: [
          Gap(5),

          ///今日の目標
          DailyGoal(),

          ///学習状況ダッシュボード
          Dashboard(),

          ///グループごとの進捗
          GroupProgress(),

          RankScore(),
        ],
      ),
    );
  }
}
