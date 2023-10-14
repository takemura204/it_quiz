import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

///問題ジャンル
@freezed
class Dashboard with _$Dashboard {
  factory Dashboard({
    @Default([]) final List<Quiz> quizList, //クイズ一覧
    @Default(Duration.zero) final Duration todayDuration,
    @Default(Duration.zero) final Duration allDuration,
    @Default(0) final int todayQuizCount,
    @Default(0) final int allQuizCount,
  }) = _Dashboard;

  Dashboard._();

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}
