import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    await _loadQuizData(); // データを読み込む
    setWeeklyData();
    super.initState();
  }

  ///読み込み
  Future _loadQuizData() async {
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

  void setWeeklyData() {
    final now = DateTime.now();
    final startOfWeek =
        DateTime(now.year, now.month, now.day - (now.weekday - 1)); // 月曜日の00:00
    final endOfWeek = startOfWeek.add(const Duration(
        days: 6,
        hours: 23,
        minutes: 59,
        seconds: 59,
        milliseconds: 999)); // 日曜日の23:59:59.999

    final totalQuizList = state.totalQuizList;
    final weeklyQuizList = totalQuizList
        .where((x) =>
            x.timeStamp!.isAfter(startOfWeek) &&
            x.timeStamp!.isBefore(
                endOfWeek.add(const Duration(days: 1)))) // 日曜日の終わりまでを含むために1日追加
        .toList();

    final List<DateTime> weekDays = [];
    for (int i = 0; i <= endOfWeek.difference(startOfWeek).inDays; i++) {
      weekDays.add(startOfWeek.add(Duration(days: i)));
    }

    final List<int> weeklyQuizCounts = [];

    for (DateTime day in weekDays) {
      final quizzesForTheDay = weeklyQuizList
          .where((quiz) =>
              quiz.timeStamp?.day == day.day &&
              quiz.timeStamp?.month == day.month &&
              quiz.timeStamp?.year == day.year)
          .toList();
      final quizCount = quizzesForTheDay.fold<int>(
          0, (prev, quiz) => prev + quiz.quizItemList.length);
      weeklyQuizCounts.add(quizCount);
    }

    state = state.copyWith(
      startWeekRange: startOfWeek,
      endWeekRange: endOfWeek,
      weekDays: weekDays,
      weeklyQuizCounts: weeklyQuizCounts,
      weeklyQuizList: weeklyQuizList,
    );

    final weekRange = DateTimeRange(start: startOfWeek, end: endOfWeek);

    print({"weekRange", weekRange});
  }

  void selectXIndex(int selectedXIndex) {
    state = state.copyWith(selectedXIndex: selectedXIndex);
  }
}
