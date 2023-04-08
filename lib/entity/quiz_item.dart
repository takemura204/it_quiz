import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/entity/quiz.dart';

part 'quiz_item.freezed.dart';

///問題ジャンル
@freezed
abstract class QuizItem with _$QuizItem {
  const factory QuizItem({
    @Default(0) final int id, //問題ID
    @Default("") final String group, //問題のジャンル別に分ける
    @Default("") final String title, //問題タイトル
    @Default(false) final bool isCompleted, //全て問題を解いたか
    @Default([]) final List<Quiz> quizList, //クイズ一覧
  }) = _Create;
}
