import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';
import 'package:kentei_quiz/model/quiz/quiz_item.dart';

part 'quizzes.freezed.dart';
part 'quizzes.g.dart';

///問題ジャンル
@freezed
class Quizzes with _$Quizzes {
  const factory Quizzes({
    @Default([]) final List<Quiz> quizList, //クイズ一覧
    @Default([]) final List<Quiz> userQuizList, //ユーザーが解いたクイズ一覧
    Quiz? weakQuiz, //苦手克服
    Quiz? dailyQuiz, //今日のクイズ
    Quiz? testQuiz, //全てのクイズ
    @Default([]) final List<QuizItem> dailyQuizItem, //デイリークイズ
    @Default([]) final List<QuizItem> weakQuizItem, //苦手クイズ
    @Default([]) final List<QuizItem> testQuizItem, //テストクイズ

    @Default(0) final int selectQuizIndex, //選択したクイズ
    @Default(QuizType.study) final QuizType quizType, //クイズタイプ
  }) = _Quizzes;
  Quizzes._();
  factory Quizzes.fromJson(Map<String, dynamic> json) =>
      _$QuizzesFromJson(json);
}

enum QuizType {
  study,
  weak,
  daily,
  test,
}
