import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_state.dart';

import '../quiz/quiz_model.dart';
import '../quiz/quizzes.dart';
import 'dashboard.dart';

final dashboardModelProvider = StateNotifierProvider<DashboardModel, Dashboard>(
  (ref) => DashboardModel(ref),
  dependencies: [quizModelProvider],
);

class DashboardModel extends StateNotifier<Dashboard> {
  DashboardModel(this.ref) : super(Dashboard()) {
    _initState();
  }

  final Ref ref;

  Future _initState() async {
    _setIsLoading(true);
    ref.listen<Quizzes>(quizModelProvider, (_, quizzes) async {
      if (quizzes.isLoading) {
        await Future.wait([
          loadData(), // データを読み込む
          // _loadDailyData(),
          loadWeeklyAndMontylyData(),
        ]);
        _setIsLoading(false);
      }
    });

    state = state.copyWith(isLoading: false);
  }

  Future loadData() async {
    final today = DateTime.now();
    final quizzes = ref.read(quizModelProvider).historyQuizList;

    // デイリー、週次、月次データの初期化
    Duration dailyDuration = Duration.zero;
    int dailyQuizCount = 0;
    int dailyQuizCorrectCount = 0;

    Duration weeklyDuration = Duration.zero;
    int weeklyQuizCount = 0;
    int weeklyQuizCorrectCount = 0;

    Duration monthlyDuration = Duration.zero;
    int monthlyQuizCount = 0;
    int monthlyQuizCorrectCount = 0;

    final startOfWeek =
        DateTime(today.year, today.month, today.day - (today.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(
        days: 6, hours: 23, minutes: 59, seconds: 59, milliseconds: 999));
    final startOfMonth = DateTime(today.year, today.month, 1);
    final endOfMonth =
        DateTime(today.year, today.month + 1, 0, 23, 59, 59, 999);

    // 共通のロジックでデータを集計
    for (var quiz in quizzes) {
      // デイリーデータの集計
      if (quiz.timeStamp?.day == today.day &&
          quiz.timeStamp?.month == today.month &&
          quiz.timeStamp?.year == today.year) {
        dailyDuration += quiz.duration;
        dailyQuizCount += quiz.quizItemList.length;
        dailyQuizCorrectCount +=
            quiz.quizItemList.where((x) => x.isJudge).toList().length;
      }

      // 週次データの集計
      if (quiz.timeStamp!
              .isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
          quiz.timeStamp!.isBefore(endOfWeek.add(const Duration(days: 1)))) {
        weeklyDuration += quiz.duration;
        weeklyQuizCount += quiz.quizItemList.length;
        weeklyQuizCorrectCount +=
            quiz.quizItemList.where((x) => x.isJudge).toList().length;
      }

      // 月次データの集計
      if (quiz.timeStamp!
              .isAfter(startOfMonth.subtract(const Duration(days: 1))) &&
          quiz.timeStamp!.isBefore(endOfMonth.add(const Duration(days: 1)))) {
        monthlyDuration += quiz.duration;
        monthlyQuizCount += quiz.quizItemList.length;
        monthlyQuizCorrectCount +=
            quiz.quizItemList.where((x) => x.isJudge).toList().length;
      }
    }

    // 結果を Dashboard ステートに設定
    state = state.copyWith(
      totalQuizList: quizzes,
      dailyDuration: dailyDuration,
      dailyQuizCount: dailyQuizCount,
      dailyQuizCorrectCount: dailyQuizCorrectCount,
      weeklyDuration: weeklyDuration,
      weeklyQuizCount: weeklyQuizCount,
      weeklyQuizCorrectCount: weeklyQuizCorrectCount,
      monthlyDuration: monthlyDuration,
      monthlyQuizCount: monthlyQuizCount,
      monthlyQuizCorrectCount: monthlyQuizCorrectCount,
    );

    print({'日次', dailyQuizCount, dailyQuizCount});
    print({'週次', weeklyDuration, weeklyQuizCount});
    print({'月次', monthlyDuration, monthlyQuizCount});
  }

  //
  // ///DailyData読み込み
  // Future _loadDailyData() async {
  //   final List<Quiz> totalQuizList =
  //       ref.read(quizModelProvider).historyQuizList;
  //   final today = DateTime.now();
  //   Duration dailyDuration = Duration.zero;
  //   int dailyQuizCount = 0;
  //   int dailyQuizCorrectCount = 0;
  //
  //   Duration allDuration = Duration.zero;
  //   int allQuizCount = 0;
  //   int allCorrectQuizCount = 0;
  //
  //   for (var quiz in totalQuizList) {
  //     if (quiz.timeStamp?.day == today.day &&
  //         quiz.timeStamp?.month == today.month &&
  //         quiz.timeStamp?.year == today.year) {
  //       dailyDuration += quiz.duration;
  //       dailyQuizCount += quiz.quizItemList.length;
  //       dailyQuizCorrectCount +=
  //           quiz.quizItemList.where((x) => x.isJudge).toList().length;
  //     }
  //
  //     allDuration += quiz.duration;
  //     allQuizCount += quiz.quizItemList.length;
  //     allCorrectQuizCount =
  //         quiz.quizItemList.where((x) => x.isJudge).toList().length;
  //   }
  //
  //   state = state.copyWith(
  //     totalQuizList: totalQuizList,
  //     dailyDuration: dailyDuration,
  //     allDuration: allDuration,
  //     dailyQuizCount: dailyQuizCount,
  //     dailyQuizCorrectCount: dailyQuizCorrectCount,
  //     allQuizCount: allQuizCount,
  //     allQuizCorrectCount: allCorrectQuizCount,
  //   );
  // }

  ///毎月と毎週のデータ読み込み
  Future loadWeeklyAndMontylyData() async {
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
      _setPeriodData(startOfWeek, endOfWeek);
    }
    //月
    else if (selectedPeriodType == PeriodType.monthly) {
      final now = DateTime.now();
      final startOfMonth = DateTime(now.year, now.month, 1); // 月の初めの00:00
      final endOfMonth = DateTime(
          now.year, now.month + 1, 0, 23, 59, 59, 999); // 月末の23:59:59.999
      print({startOfMonth, endOfMonth});
      _setPeriodData(startOfMonth, endOfMonth);
    }
  }

  void updatePeriodData(int offset) {
    final selectedPeriodType =
        ref.read(homeDashboardScreenProvider).selectedPeriodType;
    //週
    if (selectedPeriodType == PeriodType.weekly) {
      final weekOffset = state.weekOffset + offset;
      state = state.copyWith(weekOffset: weekOffset);
      final now = DateTime.now().add(Duration(days: weekOffset * 7));
      final startOfWeek = DateTime(
          now.year, now.month, now.day - (now.weekday - 1)); // 月曜日の00:00
      final endOfWeek = startOfWeek.add(const Duration(
          days: 6,
          hours: 23,
          minutes: 59,
          seconds: 59,
          milliseconds: 999)); // 日曜日の23:59:59.999
      _setPeriodData(startOfWeek, endOfWeek);
    }
    //月
    else if (selectedPeriodType == PeriodType.monthly) {
      final monthOffset = state.monthOffset + offset;
      state = state.copyWith(monthOffset: monthOffset);
      final now = DateTime.now();
      final newMonth = now.month + monthOffset;
      final newYear = now.year + ((newMonth - 1) ~/ 12);
      final adjustedMonth = ((newMonth - 1) % 12) + 1;
      final startOfMonth = DateTime(newYear, adjustedMonth, 1); // 月の初めの00:00
      final endOfMonth = DateTime(
          newYear, adjustedMonth + 1, 0, 23, 59, 59, 999); // 月末の23:59:59.999

      _setPeriodData(startOfMonth, endOfMonth);
    }
  }

  void _setPeriodData(DateTime startOfPeriod, DateTime endOfPeriod) {
    print({startOfPeriod, endOfPeriod});
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

    //問題数を追加
    final List<int> periodQuizCountList = [];
    final List<int> periodDurationList = [];
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
      periodQuizCountList.add(quizCount);
      periodDurationList.add(duration.inMinutes);
    }
    //  合計
    final int periodQuizCount = periodQuizCountList.fold(0, (a, b) => a + b);
    final int periodDuration = periodDurationList.fold(0, (a, b) => a + b);
    final runningDays = periodQuizCountList.where((x) => x > 0).toList().length;

    state = state.copyWith(
      periodQuizList: weeklyQuizList,
      startPeriodRange: startOfPeriod,
      endPeriodRange: endOfPeriod,
      periodDays: periodDays,
      periodQuizCountList: periodQuizCountList,
      periodDurationList: periodDurationList,
      periodQuizCount: periodQuizCount,
      // periodDuration: periodDuration,
      runningDays: runningDays,
    );

    ref.read(homeDashboardScreenProvider.notifier).setChartData();
  }

  void _setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
