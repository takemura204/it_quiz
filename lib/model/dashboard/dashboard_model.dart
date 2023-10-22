import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:state_notifier/state_notifier.dart';

import '../quiz/quiz.dart';
import '../quiz/quiz_model.dart';
import 'dashboard.dart';

final dashboardModelProvider = StateNotifierProvider<DashboardModel, Dashboard>(
  (ref) => DashboardModel(ref),
);

class DashboardModel extends StateNotifier<Dashboard> with LocatorMixin {
  DashboardModel(this.ref) : super(Dashboard()) {
    initState();
  }

  final Ref ref;

  @override
  Future initState() async {
    // _resetData();
    await _loadDailyData(); // データを読み込む
    loadWeeklyData();
    super.initState();
  }

  ///DailyData読み込み
  Future _loadDailyData() async {
    final List<Quiz> totalQuizList =
        ref.read(quizModelProvider).historyQuizList;
    final today = DateTime.now();
    Duration dailyDuration = Duration.zero;
    int dailyQuizCount = 0;

    Duration allDuration = Duration.zero;
    int allQuizCount = 0;

    for (var quiz in totalQuizList) {
      if (quiz.timeStamp?.day == today.day &&
          quiz.timeStamp?.month == today.month &&
          quiz.timeStamp?.year == today.year) {
        dailyDuration += quiz.duration;
        dailyQuizCount += quiz.quizItemList.length;
      }

      allDuration += quiz.duration;
      allQuizCount += quiz.quizItemList.length;
    }

    state = state.copyWith(
      totalQuizList: totalQuizList,
      dailyDuration: dailyDuration,
      allDuration: allDuration,
      dailyQuizCount: dailyQuizCount,
      allQuizCount: allQuizCount,
    );
  }

  ///WeeklyData読み込み
  void loadWeeklyData() {
    final now = DateTime.now();
    final startOfWeek =
        DateTime(now.year, now.month, now.day - (now.weekday - 1)); // 月曜日の00:00
    final endOfWeek = startOfWeek.add(const Duration(
        days: 6,
        hours: 23,
        minutes: 59,
        seconds: 59,
        milliseconds: 999)); // 日曜日の23:59:59.999
    setWeeklyData(startOfWeek, endOfWeek);
  }

  void updateWeeklyData(int offset) {
    final weekOffset = state.weekOffset + offset;
    state = state.copyWith(weekOffset: weekOffset);
    final now = DateTime.now().add(Duration(days: weekOffset * 7));
    final startOfWeek =
        DateTime(now.year, now.month, now.day - (now.weekday - 1)); // 月曜日の00:00
    final endOfWeek = startOfWeek.add(const Duration(
        days: 6,
        hours: 23,
        minutes: 59,
        seconds: 59,
        milliseconds: 999)); // 日曜日の23:59:59.999
    setWeeklyData(startOfWeek, endOfWeek);
  }

  void setWeeklyData(DateTime startOfWeek, DateTime endOfWeek) {
    final totalQuizList = state.totalQuizList;
    final weeklyQuizList = totalQuizList
        .where((x) =>
            x.timeStamp!.isAfter(startOfWeek) &&
            x.timeStamp!.isBefore(endOfWeek.add(const Duration(days: 1))))
        .toList();

    final List<DateTime> weekDays = [];
    for (int i = 0; i <= endOfWeek.difference(startOfWeek).inDays; i++) {
      weekDays.add(startOfWeek.add(Duration(days: i)));
    }

    //1週間の問題数を追加
    final List<int> weeklyQuizCounts = [];
    final List<int> weeklyDuration = [];
    for (DateTime day in weekDays) {
      final quizzesForTheDay = weeklyQuizList
          .where((quiz) =>
              quiz.timeStamp?.day == day.day &&
              quiz.timeStamp?.month == day.month &&
              quiz.timeStamp?.year == day.year)
          .toList();
      final quizCount = quizzesForTheDay.fold<int>(
          0, (prev, quiz) => prev + quiz.quizItemList.length);
      final duration = quizzesForTheDay.fold<Duration>(
          Duration.zero, (prev, quiz) => prev + quiz.duration);
      weeklyQuizCounts.add(quizCount);
      weeklyDuration.add(duration.inMinutes);
    }
    //  合計
    final int weeklyQuizTotal = weeklyQuizCounts.fold(0, (a, b) => a + b);
    final int weeklyDurationTotal = weeklyDuration.fold(0, (a, b) => a + b);
    final runningDays = weeklyQuizCounts.where((x) => x > 0).toList().length;

    state = state.copyWith(
      weeklyQuizList: weeklyQuizList,
      startWeekRange: startOfWeek,
      endWeekRange: endOfWeek,
      weekDays: weekDays,
      weeklyQuizCounts: weeklyQuizCounts,
      weeklyQuizTotal: weeklyQuizTotal,
      weeklyDuration: weeklyDuration,
      runningDays: runningDays,
      weeklyDurationTotal: weeklyDurationTotal,
    );

    ref.read(homeDashboardScreenProvider.notifier).setData();
  }
}
