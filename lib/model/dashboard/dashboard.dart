import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

///問題ジャンル
@freezed
class Dashboard with _$Dashboard {
  factory Dashboard({
    @Default([]) final List<Quiz> totalQuizList,
    @Default(Duration.zero) final Duration dailyDuration,
    @Default(Duration.zero) final Duration allDuration,
    @Default(0) final int dailyQuizCount,
    @Default(0) final int allQuizCount,
    @Default([]) final List<Quiz> weeklyQuizList, //今週のクイズ一覧
    DateTime? startWeekRange, // 今週の月曜日の日付
    DateTime? endWeekRange, // 今週の日曜日の日付
    @Default([]) final List<DateTime> weekDays, //今週の日にち一覧
    @Default([]) final List<int> weeklyQuizCounts, //今週のデータ一覧
    @Default(-1) final int selectedXIndex,
  }) = _Dashboard;

  Dashboard._();

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}
