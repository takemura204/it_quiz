import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/quiz/quiz.dart';

part 'quiz_history_screen_state.freezed.dart';

@freezed
class QuizHistoryScreenState with _$QuizHistoryScreenState {
  const QuizHistoryScreenState._();

  const factory QuizHistoryScreenState({
    @Default([]) final List<Quiz> quizList, //問題
  }) = _Create;
}
