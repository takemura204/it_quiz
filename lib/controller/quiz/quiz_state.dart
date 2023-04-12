import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_state.freezed.dart';
part 'quiz_state.g.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState({
    required final int quizId, //問題番号
    required final String question, //問題文
    required final String ans, //答え
    required final bool isWeak, //苦手か？
    required final bool isJudge, //正解したか?
    required final List<String> choices, //選択肢
  }) = _QuizState;
  factory QuizState.fromJson(Map<String, dynamic> json) =>
      _$QuizStateFromJson(json);
}
