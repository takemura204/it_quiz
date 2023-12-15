import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

///問題ジャンル
@freezed
class Dashboard with _$Dashboard {
  factory Dashboard({
    @Default(false) bool isLoading,

    ///Total
    @Default([]) final List<Quiz> totalQuizList,
    @Default(Duration.zero) final Duration allDuration,
    @Default(0) final int allQuizCount,
    @Default(0) final int allQuizCorrectCount,
    @Default(0) final int runningDays,

    ///Daily
    @Default(Duration.zero) final Duration dailyDuration,
    @Default(0) final int dailyQuizCount,
    @Default(0) final int dailyQuizCorrectCount,

    ///Weekly
    @Default(Duration.zero) final Duration weeklyDuration,
    @Default(0) final int weeklyQuizCount,
    @Default(0) final int weeklyQuizCorrectCount,

    ///Monthly
    @Default(Duration.zero) final Duration monthlyDuration,
    @Default(0) final int monthlyQuizCount,
    @Default(0) final int monthlyQuizCorrectCount,
  }) = _Dashboard;

  Dashboard._();

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}
