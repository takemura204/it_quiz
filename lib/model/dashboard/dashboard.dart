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
    @Default(0) final int allQuizCorrectCount,
    @Default(0) final int runningDays,

    ///Daily
    @Default(Duration.zero) final Duration dailyDuration,
    @Default(0) final int dailyQuizCount,
    @Default(0) final int dailyQuizCorrectCount,

    ///Weekly・Monthly
    @Default([]) final List<Quiz> periodQuizList, //今週/今月のクイズ一覧
    DateTime? startPeriodRange, // 今週の月曜日の日付
    DateTime? endPeriodRange, // 今週の日曜日の日付
    @Default([]) final List<DateTime> periodDays, //今週の「月/日」一覧
    @Default([]) final List<int> periodQuizCounts, //今週の問題数一覧
    @Default(0) final int periodQuizTotal, //今週のデータ一覧
    @Default([]) final List<int> periodDuration, //今週の学習時間
    @Default(0) final int periodDurationTotal, //今週のデータ一覧
    @Default(0) final int weekOffset, //週の期間選択
    @Default(0) final int monthOffset, //月の期間選択
  }) = _Dashboard;

  Dashboard._();

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}
