import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/quiz_item.dart';

part 'quiz_learn_screen_state.freezed.dart';

@freezed
class QuizLearnScreenState with _$QuizLearnScreenState {
  const QuizLearnScreenState._();
  const factory QuizLearnScreenState({
    @Default(false) final bool isAnsView,
    @Default(false) final bool isResultScreen,
    @Default(0) final int quizIndex, //問題番号
    @Default(0) final int lapIndex, //何周目
    @Default([]) final List<LearnQuiz> knowRememberQuestions,
    @Default([]) final List<LearnQuiz> unKnowRememberQuestions,
  }) = _Create;
}
