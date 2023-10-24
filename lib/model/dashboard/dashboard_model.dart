import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_state.dart';
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
    loadWeeklyAndMontylyData();
    super.initState();
  }

  ///DailyData読み込み
  Future _loadDailyData() async {
    final List<Quiz> totalQuizList =
        ref.read(quizModelProvider).historyQuizList;
    final today = DateTime.now();
    Duration dailyDuration = Duration.zero;
    int dailyQuizCount = 0;
    int dailyQuizCorrectCount = 0;

    Duration allDuration = Duration.zero;
    int allQuizCount = 0;
    int allCorrectQuizCount = 0;

    for (var quiz in totalQuizList) {
      if (quiz.timeStamp?.day == today.day &&
          quiz.timeStamp?.month == today.month &&
          quiz.timeStamp?.year == today.year) {
        dailyDuration += quiz.duration;
        dailyQuizCount += quiz.quizItemList.length;
        dailyQuizCorrectCount +=
            quiz.quizItemList.where((x) => x.isJudge).toList().length;
      }

      allDuration += quiz.duration;
      allQuizCount += quiz.quizItemList.length;
      allCorrectQuizCount =
          quiz.quizItemList.where((x) => x.isJudge).toList().length;
    }

    state = state.copyWith(
      totalQuizList: totalQuizList,
      dailyDuration: dailyDuration,
      allDuration: allDuration,
      dailyQuizCount: dailyQuizCount,
      dailyQuizCorrectCount: dailyQuizCorrectCount,
      allQuizCount: allQuizCount,
      allQuizCorrectCount: allCorrectQuizCount,
    );
  }

  ///WeeklyData読み込み
  void loadWeeklyAndMontylyData() {
    final selectedPeriodType =
        ref.read(homeDashboardScreenProvider).selectedPeriodType;
    //週
    if (selectedPeriodType == PeriodType.weekly) {
      final now = DateTime.now();
      final startOfWeek = DateTime(
          now.year, now.month, now.day - (now.weekday - 1)); // 月曜日の00:00
      final endOfWeek = startOfWeek.add(const Duration(
          days: 6,
          hours: 23,
          minutes: 59,
          seconds: 59,
          milliseconds: 999)); // 日曜日の23:59:59.999
      setPeriodData(startOfWeek, endOfWeek);
    }
    //月
    else if (selectedPeriodType == PeriodType.monthly) {
      final now = DateTime.now();
      final startOfMonth = DateTime(now.year, now.month, 1); // 月の初めの00:00
      final endOfMonth = DateTime(
          now.year, now.month + 1, 0, 23, 59, 59, 999); // 月末の23:59:59.999
      setPeriodData(startOfMonth, endOfMonth);
    }
  }

  void updateWeeklyData(int offset) {
    final selectedPeriodType =
        ref.read(homeDashboardScreenProvider).selectedPeriodType;
    //週
    if (selectedPeriodType == PeriodType.weekly) {
      final weekOffset = state.weekOffset + offset;
      state = state.copyWith(weekOffset: weekOffset);
      print({"weekOffset", state.weekOffset});
      final now = DateTime.now().add(Duration(days: weekOffset * 7));
      final startOfWeek = DateTime(
          now.year, now.month, now.day - (now.weekday - 1)); // 月曜日の00:00
      final endOfWeek = startOfWeek.add(const Duration(
          days: 6,
          hours: 23,
          minutes: 59,
          seconds: 59,
          milliseconds: 999)); // 日曜日の23:59:59.999
      setPeriodData(startOfWeek, endOfWeek);
    }
    //月
    else if (selectedPeriodType == PeriodType.monthly) {
      final monthOffset = state.monthOffset + offset;
      state = state.copyWith(monthOffset: monthOffset);
      print({"monthOffset", state.monthOffset});
      final now = DateTime.now();
      final newMonth = now.month + monthOffset;
      final newYear = now.year + ((newMonth - 1) ~/ 12);
      final adjustedMonth = ((newMonth - 1) % 12) + 1;
      final startOfMonth = DateTime(newYear, adjustedMonth, 1); // 月の初めの00:00
      final endOfMonth = DateTime(
          newYear, adjustedMonth + 1, 0, 23, 59, 59, 999); // 月末の23:59:59.999
      setPeriodData(startOfMonth, endOfMonth);
    }
  }

  void setPeriodData(DateTime startOfPeriod, DateTime endOfPeriod) {
    final totalQuizList = state.totalQuizList;
    final weeklyQuizList = totalQuizList
        .where((x) =>
            x.timeStamp!.isAfter(startOfPeriod) &&
            x.timeStamp!.isBefore(endOfPeriod.add(const Duration(days: 1))))
        .toList();

    final List<DateTime> periodDays = [];
    for (int i = 0; i <= endOfPeriod.difference(startOfPeriod).inDays; i++) {
      periodDays.add(startOfPeriod.add(Duration(days: i)));
    }

    //1週間の問題数を追加
    final List<int> periodQuizCounts = [];
    final List<int> periodDuration = [];
    for (DateTime day in periodDays) {
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
      periodQuizCounts.add(quizCount);
      periodDuration.add(duration.inMinutes);
    }
    //  合計
    final int periodQuizTotal = periodQuizCounts.fold(0, (a, b) => a + b);
    final int periodDurationTotal = periodDuration.fold(0, (a, b) => a + b);
    final runningDays = periodQuizCounts.where((x) => x > 0).toList().length;

    state = state.copyWith(
      periodQuizList: weeklyQuizList,
      startPeriodRange: startOfPeriod,
      endPeriodRange: endOfPeriod,
      periodDays: periodDays,
      periodQuizCounts: periodQuizCounts,
      periodQuizTotal: periodQuizTotal,
      periodDuration: periodDuration,
      runningDays: runningDays,
      periodDurationTotal: periodDurationTotal,
    );

    ref.read(homeDashboardScreenProvider.notifier).setData();
  }

// void setMonthlyData(DateTime startOfMonth, DateTime endOfMonth) {
//   final totalQuizList = state.totalQuizList;
//   final monthlyQuizList = totalQuizList
//       .where((x) =>
//           x.timeStamp!.isAfter(startOfMonth) &&
//           x.timeStamp!.isBefore(endOfMonth.add(const Duration(days: 1))))
//       .toList();
//
//   final List<DateTime> monthDays = [];
//   for (int i = 0; i <= endOfMonth.difference(startOfMonth).inDays; i++) {
//     monthDays.add(startOfMonth.add(Duration(days: i)));
//   }
//
//   //1ヶ月の問題数を追加
//   final List<int> monthlyQuizCounts = [];
//   final List<int> monthlyDuration = [];
//   for (DateTime day in monthDays) {
//     final quizzesForTheDay = monthlyQuizList
//         .where((quiz) =>
//             quiz.timeStamp?.day == day.day &&
//             quiz.timeStamp?.month == day.month &&
//             quiz.timeStamp?.year == day.year)
//         .toList();
//     final quizCount = quizzesForTheDay.fold<int>(
//         0, (prev, quiz) => prev + quiz.quizItemList.length);
//     final duration = quizzesForTheDay.fold<Duration>(
//         Duration.zero, (prev, quiz) => prev + quiz.duration);
//     monthlyQuizCounts.add(quizCount);
//     monthlyDuration.add(duration.inMinutes);
//   }
//   //  合計
//   final int monthlyQuizTotal = monthlyQuizCounts.fold(0, (a, b) => a + b);
//   final int monthlyDurationTotal = monthlyDuration.fold(0, (a, b) => a + b);
//   final runningDays = monthlyQuizCounts.where((x) => x > 0).toList().length;
//
//   state = state.copyWith(
//     monthlyQuizList: monthlyQuizList,
//     startMonthRange: startOfMonth,
//     endMonthRange: endOfMonth,
//     monthDays: monthDays,
//     monthlyQuizCounts: monthlyQuizCounts,
//     monthlyQuizTotal: monthlyQuizTotal,
//     monthlyDuration: monthlyDuration,
//     runningDays: runningDays, // ここも適切に修正するかもしれません
//     monthlyDurationTotal: monthlyDurationTotal,
//   );
//
//   ref
//       .read(homeDashboardScreenProvider.notifier)
//       .setData(); // このメソッドが定義されていないため、適切に修正する必要があります
// }
}
