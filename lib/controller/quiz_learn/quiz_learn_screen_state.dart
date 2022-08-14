import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/quiz_item.dart';

part 'quiz_learn_screen_state.freezed.dart';

@freezed
class QuizLearnScreenState with _$QuizLearnScreenState {
  const factory QuizLearnScreenState({
    @Default(false) final bool isAnsView,
    @Default(0) final int quizIndex, //問題番号
    @Default(0) final int lapIndex, //何周目
    @Default([]) final List<RememberQuiz> knowRememberQuestions,
    @Default([]) final List<RememberQuiz> unKnowRememberQuestions,
  }) = _Create;
}
