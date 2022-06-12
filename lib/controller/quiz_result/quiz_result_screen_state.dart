import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/quiz_item/quiz_item.dart';

part 'quiz_result_screen_state.freezed.dart';

@freezed
class QuizResultScreenState with _$QuizResultScreenState {
  const factory QuizResultScreenState({
    @Default(false) final bool isAnsView,
    @Default(0) final int quizIndex, //問題番号
    @Default(0) final int lapIndex, //何周目
    @Default([]) final List<RememberQuiz> knowRememberQuestions,
    @Default([]) final List<RememberQuiz> unKnowRememberQuestions,
  }) = _Create;
}
