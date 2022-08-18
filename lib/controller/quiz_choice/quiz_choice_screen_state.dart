import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/quiz_item.dart';

part 'quiz_choice_screen_state.freezed.dart';

@freezed
class QuizChoiceScreenState with _$QuizChoiceScreenState {
  QuizChoiceScreenState._();
  const factory QuizChoiceScreenState({
    @Default(false) final bool isAnsView,
    @Default(0) final int quizIndex, //問題番号]
  }) = _Create;
}
