import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

///問題ジャンル
@freezed
class Dashboard with _$Dashboard {
  factory Dashboard({
    ///Total
    @Default([]) final List<Quiz> totalQuizList,
    @Default(Duration.zero) final Duration allDuration,
    @Default(0) final int allQuizCount,
    @Default(0) final int runningDays,

    ///Daily
    @Default(Duration.zero) final Duration dailyDuration,
    @Default(0) final int dailyQuizCount,

    ///Weekly
    @Default([]) final List<Quiz> weeklyQuizList, //今週のクイズ一覧
    DateTime? startWeekRange, // 今週の月曜日の日付
    DateTime? endWeekRange, // 今週の日曜日の日付
    @Default([]) final List<DateTime> weekDays, //今週の「月/日」一覧
    @Default(0) final int weekOffset, //週の期間選択
    @Default([]) final List<int> weeklyQuizCounts, //今週の問題数一覧
    @Default(0) final int weeklyQuizTotal, //今週のデータ一覧
    @Default([]) final List<int> weeklyDuration, //今週の学習時間
    @Default(0) final int weeklyDurationTotal, //今週のデータ一覧

    ///Monthly
    @Default([]) final List<Quiz> monthlyQuizList, //今週のクイズ一覧
    DateTime? startMonthRange, // 今週の月曜日の日付
    DateTime? endMonthRange, // 今週の日曜日の日付
    @Default([]) final List<DateTime> monthDays, //月の日にち一覧
    @Default([]) final List<int> monthQuizCounts, //月のデータ一覧
    @Default(0) final int monthQuizTotal, //月のデータ一覧
    @Default(0) final int monthOffset, //月の期間選択

    ///Monthly
  }) = _Dashboard;

  Dashboard._();

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}
