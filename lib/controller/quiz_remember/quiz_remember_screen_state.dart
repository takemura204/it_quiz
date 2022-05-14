import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_remember_screen_state.freezed.dart';

@freezed
class QuizRememberScreenState with _$QuizRememberScreenState {
  const factory QuizRememberScreenState({
    @Default(false) final bool isAnsView,
  }) = _Create;
}
