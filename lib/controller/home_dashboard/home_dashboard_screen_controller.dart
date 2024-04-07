import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/dashboard/dashboard_model.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';

import '../../model/user/auth_model.dart';
import 'home_dashboard_screen_state.dart';

final homeDashboardScreenProvider = StateNotifierProvider<
    HomeDashboardScreenController, HomeDashboardScreenState>(
  (ref) => HomeDashboardScreenController(ref: ref),
  dependencies: [quizModelProvider, dashboardModelProvider],
);

class HomeDashboardScreenController
    extends StateNotifier<HomeDashboardScreenState> {
  HomeDashboardScreenController({required this.ref})
      : super(HomeDashboardScreenState()) {
    initState();
  }

  final Ref ref;

  Future initState() async {
    _setIsLoading(true);
    loadPeriodData();
    _setIsLoading(false);
  }

  ///期間データ読み込み
  Future loadPeriodData() async {
    final selectedPeriodType = state.selectedPeriodType;
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

  void setPeriodData(DateTime startOfPeriod, DateTime endOfPeriod) {
    final totalQuizList = ref.read(dashboardModelProvider).totalQuizList;
    final periodQuizList = totalQuizList
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
      final quizzesForTheDay = periodQuizList
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

    state = state.copyWith(
      periodQuizList: periodQuizList,
      startPeriodRange: startOfPeriod,
      endPeriodRange: endOfPeriod,
      periodDays: periodDays,
      periodQuizCountList: periodQuizCountList,
      periodDurationList: periodDurationList,
      periodQuizCount: periodQuizCount,
      periodDuration: periodDuration,
    );

    setChartData();
  }

  Future setChartData() async {
    final selectedChartType = state.selectedChartType;
    final userModel = ref.read(authModelProvider);
    switch (selectedChartType) {
      case ChartType.quizCount:
        final periodQuizCounts = state.periodQuizCountList;
        final periodDays = state.periodDays;
        final dailyGoal = userModel.dailyGoal;
        state = state.copyWith(
            unitY: "問",
            valueX: periodQuizCounts,
            valueY: dailyGoal,
            days: periodDays);
        break;
      case ChartType.duration:
        final periodDuration = state.periodDurationList;
        final periodDays = state.periodDays;

        final maxDuration =
            periodDuration.reduce((curr, next) => curr > next ? curr : next);
        final dailyDurationGoal = maxDuration > 20 ? maxDuration / 2 : 10;

        state = state.copyWith(
          unitY: "分",
          valueX: periodDuration,
          valueY: dailyDurationGoal.toInt(),
          days: periodDays,
        );
        break;
      default:
        final periodQuizCounts = state.periodQuizCountList;
        final periodDays = state.periodDays;
        final dailyGoal = userModel.dailyGoal;
        state = state.copyWith(
            unitY: "問",
            valueX: periodQuizCounts,
            valueY: dailyGoal,
            days: periodDays);
    }
  }

  void setSelectedChartType(ChartType type) {
    state = state.copyWith(selectedChartType: type);
    setChartData();
  }

  void setSelectedPeriodType(int tabIndex) {
    if (tabIndex == 0) {
      state = state.copyWith(
          selectedPeriodType: PeriodType.weekly, tabIndex: tabIndex);
    } else if (tabIndex == 1) {
      state = state.copyWith(
          selectedPeriodType: PeriodType.monthly, tabIndex: tabIndex);
    } else {
      state = state.copyWith(
          selectedPeriodType: PeriodType.weekly, tabIndex: tabIndex);
    }

    loadPeriodData();
    setChartData();
  }

  void updatePeriodData(int offset) {
    final selectedPeriodType = state.selectedPeriodType;
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
      setPeriodData(startOfWeek, endOfWeek);
    }
    //月
    else if (selectedPeriodType == PeriodType.monthly) {
      final monthOffset = state.monthOffset + offset;
      state = state.copyWith(monthOffset: monthOffset);
      final now = DateTime.now();
      int newYear = now.year;
      int newMonth = now.month + monthOffset;

      // 月と年の調整
      while (newMonth < 1) {
        newMonth += 12;
        newYear--;
      }
      while (newMonth > 12) {
        newMonth -= 12;
        newYear++;
      }

      final startOfMonth = DateTime(newYear, newMonth, 1); // 月の初めの00:00
      final endOfMonth = DateTime(
          newYear, newMonth + 1, 0, 23, 59, 59, 999); // 月末の23:59:59.999

      setPeriodData(startOfMonth, endOfMonth);
    }
  }

  void _setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
