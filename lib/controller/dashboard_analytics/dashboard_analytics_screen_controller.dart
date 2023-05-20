import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:state_notifier/state_notifier.dart';

import '../dashboard_analytics/bar_data_state.dart';
import '../quiz/quiz_state.dart';
import '../quiz_item/quiz_item_controller.dart';
import 'dashboard_analytics_screen_state.dart';

final dashboardAnalyticsScreenProvider = StateNotifierProvider<
    DashboardAnalyticsScreenController, DashboardAnalyticsScreenState>(
  (ref) => DashboardAnalyticsScreenController(ref: ref),
);

class DashboardAnalyticsScreenController
    extends StateNotifier<DashboardAnalyticsScreenState> with LocatorMixin {
  DashboardAnalyticsScreenController({required this.ref})
      : super(DashboardAnalyticsScreenState()) {
    initState();
  }
  final Ref ref;
  final tabs = [7, 31];
  final now = DateTime.now();
  final days = DateTime.now().weekday - 1;

  @override
  void initState() {
    _initData();
    _initDayRangeText();
  }

  ///ダッシュボードデータ取得
  Future _initData() async {
    _getTotalData();
    _getWeeklyData();
    _getMonthlyData();
  }

  ///「全期間」のダッシュボードデータ取得
  Future _getTotalData() async {
    final random = Random();
    const days = 90;
    final totalData = List.generate(days, (i) => _createBarData(i, random));
    final totalScore = _getScore(totalData);
    state = state.copyWith(totalData: totalData, totalScore: totalScore);
  }

  BarData _createBarData(int daysAgo, Random random) {
    final quizList = [
      ...ref
          .read(quizItemProvider)
          .expand((quizItem) => quizItem.quizList)
          .toList()
    ];
    final random = Random();
    final dailyData = <QuizState>[];
    final randomLength = random.nextInt(40) + 1;
    for (int i = 0; i < randomLength; i++) {
      if (quizList.isNotEmpty) {
        final randomIndex = random.nextInt(quizList.length);
        dailyData.add(quizList[randomIndex]);
        quizList.removeAt(randomIndex);
      } else {
        break;
      }
    }
    final day = now.subtract(Duration(days: daysAgo));
    return BarData(dailyData, day);
  }

  ///「週間」のダッシュボードデータ取得
  void _getWeeklyData() {
    final totalData = [...state.totalData];
    final weeklyIndex = state.weeklyIndex;
    final weeklyData = _groupDataByPeriod(
      totalData,
      (date) => DateTime(
          date.year, date.month, date.day - (date.weekday - 1 + 7) % 7),
      7,
    );
    final weekScore = _getScore(weeklyData[weeklyIndex]);
    state = state.copyWith(weeklyData: weeklyData, weekScore: weekScore);
  }

  ///「月間」のダッシュボードデータ取得
  void _getMonthlyData() {
    final totalData = [...state.totalData];
    final currentMonthDays = DateTime(now.year, now.month + 1, 0).day;
    final monthlyData = _groupDataByPeriod(
      totalData,
      (date) => DateTime(date.year, date.month, 1),
      currentMonthDays,
    );
    final monthScore = state.monthScore;
    state = state.copyWith(monthlyData: monthlyData, monthScore: monthScore);
  }

  ///各期間ごとにデータを集計
  List<List<BarData>> _groupDataByPeriod(
    List<BarData> dataList,
    DateTime Function(DateTime) getStartOfPeriod,
    int periodDays,
  ) {
    final Map<DateTime, List<BarData>> dataByPeriod = {};

    for (var data in dataList) {
      final periodStart = getStartOfPeriod(data.day);
      (dataByPeriod[periodStart] ??= []).add(data);
    }
    final periodStart = getStartOfPeriod(DateTime.now());
    for (var day = DateTime.now();
        day.isBefore(periodStart.add(Duration(days: periodDays)));
        day = day.add(const Duration(days: 1))) {
      if (day.isAfter(DateTime.now())) {
        if (dataByPeriod[periodStart] == null ||
            (dataByPeriod[periodStart]?.any((d) => d.day == day) ?? false) ==
                false) {
          (dataByPeriod[periodStart] ??= []).add(BarData([], day));
        }
      }
    }

    for (var periodData in dataByPeriod.values) {
      periodData.sort((a, b) => a.day.compareTo(b.day));
    }

    return dataByPeriod.values.toList();
  }

  int _getScore(List<BarData> dataList) {
    return dataList.map((data) => data.score).reduce((a, b) => a + b);
  }

  ///TabBarをタップした時
  void tapTabBar(int index) {
    _setDayRange(index);
    _initDayRangeText();
  }

  /// 前の期間に戻るボタンをタップした時
  void tapPreButton() {
    final selectedDayRange = state.selectedDayRange;
    if (selectedDayRange == 7) {
      _goPrevWeek();
    } else if (selectedDayRange == 31) {
      _goPrevMonth();
    }
    _initDayRangeText();
  }

  /// 前の期間に戻るボタンをタップした時
  void tapNextButton() {
    final selectedDayRange = state.selectedDayRange;
    if (selectedDayRange == 7) {
      _goNextWeek();
    } else if (selectedDayRange == 31) {
      _goNextMonth();
    }
    _initDayRangeText();
  }

  ///今日の日付を取得
  // void setDailyData(int value) {
  //   final weekList = [...state.totalDataList];
  //   final newValue = weekList[days].score + value;
  //   weekList[days] = BarData(newValue, state.totalDataList[days].day);
  //
  //   state = state.copyWith(dailyScore: newValue);
  // }

  ///選択期間のText取得
  void _initDayRangeText() {
    final weekText = getWeekText();
    final monthText = getMonthText();
    final selectedDayRange = state.selectedDayRange;
    if (selectedDayRange == 7) {
      state = state.copyWith(dayRangeText: weekText);
    } else if (selectedDayRange == 31) {
      state = state.copyWith(dayRangeText: monthText);
    }
  }

  ///ここから
  Future updateDailyScore(List<QuizState> quizList) async {
    final dailyData = [...state.dailyData];
    // dailyDataList.addAll(quizList);
    // final weakAllList = ref
    //     .read(quizItemProvider)
    //     .expand((quizItem) => quizItem.quizList.where((quiz) => quiz.isWeak))
    //     .toList();
    // final weakSetList = weakAllList.map((quiz) => quiz.question).toSet();
    // final weakList = weakSetList.map((question) {
    //   return weakAllList.firstWhere((quiz) => quiz.question == question);
    // }).toList();
    // final weakQuiz = state.weakQuiz.copyWith(quizList: weakList);
    // state = state.copyWith(weakQuiz: weakQuiz);
    _saveData(); // 保存
  }

  ///Quizを保存
  Future _saveData() async {
    // final prefs = await SharedPreferences.getInstance();
    // final dailyData = json.encode(state.dailyData.toJson());
    // await prefs.setString('daily_data', dailyData);
  }

  void selectXIndex(int selectedXIndex) {
    state = state.copyWith(selectedXIndex: selectedXIndex);
  }

  void setGoalY(int index) {
    if (index >= 10 && index <= 50) {
      state = state.copyWith(goalScore: index);
    }
  }

  ///期間
  void _setDayRange(int index) {
    final selectedDayRange = tabs[index];
    final tabIndex = index;
    state =
        state.copyWith(selectedDayRange: selectedDayRange, tabIndex: tabIndex);
  }

  ///先週へ
  void _goPrevWeek() {
    final weekOffset = state.weekOffset;
    final weeklyIndex = state.weeklyIndex;
    if (weekOffset > -3) {
      state = state.copyWith(
          weekOffset: weekOffset - 1, weeklyIndex: weeklyIndex + 1);
    }
  }

  ///来週へ
  void _goNextWeek() {
    final weekOffset = state.weekOffset;
    final weeklyIndex = state.weeklyIndex;
    if (weekOffset < 0) {
      state = state.copyWith(
          weekOffset: weekOffset + 1, weeklyIndex: weeklyIndex - 1);
    }
  }

  ///先月へ
  void _goPrevMonth() {
    final monthOffset = state.monthOffset;
    final monthlyIndex = state.monthlyIndex;
    if (monthOffset > -2) {
      state = state.copyWith(
          monthOffset: monthOffset - 1, monthlyIndex: monthlyIndex + 1);
    }
  }

  ///来月へ
  void _goNextMonth() {
    final monthOffset = state.monthOffset;
    final monthlyIndex = state.monthlyIndex;
    if (monthOffset < 0) {
      state = state.copyWith(
          monthOffset: monthOffset + 1, monthlyIndex: monthlyIndex - 1);
    }
  }

  String getWeekText() {
    final weekOffset = state.weekOffset;
    final startOfWeek =
        now.subtract(Duration(days: days)).add(Duration(days: 7 * weekOffset));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    final formatter = DateFormat('M/d');
    return '${formatter.format(startOfWeek)}〜${formatter.format(endOfWeek)}';
  }

  String getMonthText() {
    final monthOffset = state.monthOffset;
    final currentMonth = now.month + monthOffset;

    final year = now.year + (currentMonth - 1) ~/ 12;
    final month = (currentMonth - 1) % 12 + 1;

    return '$year年$month月';
  }
}
