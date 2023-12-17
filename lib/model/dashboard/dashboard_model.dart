import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../quiz/quiz_model.dart';
import 'dashboard.dart';

final dashboardModelProvider = StateNotifierProvider<DashboardModel, Dashboard>(
  (ref) => DashboardModel(ref),
  dependencies: [quizModelProvider],
);

class DashboardModel extends StateNotifier<Dashboard> {
  DashboardModel(this.ref) : super(Dashboard()) {
    initState();
  }

  final Ref ref;

  Future initState() async {
    _setIsLoading(true);
    loadDashboardData();
    _setIsLoading(false);
  }

  ///日次、週次、月次データの取得
  Future loadDashboardData() async {
    final today = DateTime.now();
    final quizzes = ref.read(quizModelProvider).historyQuizList;
    // 日次、週次、月次データの初期化
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

    // 挑戦した日を記録するセット
    final Set<DateTime> uniqueDays = {};

    // quizzesリストからtimeStampを取得し、異なる日をセットに追加
    for (var quiz in quizzes) {
      if (quiz.timeStamp != null) {
        final dateOnly = DateTime(
            quiz.timeStamp!.year, quiz.timeStamp!.month, quiz.timeStamp!.day);
        uniqueDays.add(dateOnly);
      }
    }

    // 挑戦した異なる日の数を計算
    final int runningDays = uniqueDays.length;

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
      runningDays: runningDays,
    );
  }

  void _setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
