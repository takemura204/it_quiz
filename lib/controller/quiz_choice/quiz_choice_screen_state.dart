import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_choice_screen_state.freezed.dart';

@freezed
class QuizChoiceScreenState with _$QuizChoiceScreenState {
  const QuizChoiceScreenState._();
  const factory QuizChoiceScreenState({
    @Default(false) final bool isAnsView,
    @Default(0) final int quizIndex, //問題番号]
  }) = _Create;
}
