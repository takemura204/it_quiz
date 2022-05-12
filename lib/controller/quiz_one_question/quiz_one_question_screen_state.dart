import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_one_question_screen_state.freezed.dart';

@freezed
class QuizOneQuestionScreenState with _$QuizOneQuestionScreenState {
  const factory QuizOneQuestionScreenState({
    @Default(false) final bool isAnsView,
  }) = _Create;
}
