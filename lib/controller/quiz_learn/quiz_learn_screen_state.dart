import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/quiz.dart';

part 'quiz_learn_screen_state.freezed.dart';

@freezed
class QuizLearnScreenState with _$QuizLearnScreenState {
  const QuizLearnScreenState._();
  const factory QuizLearnScreenState({
    @Default(false) final bool isAnsView, //正解画面切り替え
    @Default(false) final bool isResultScreen, //結果画面切り替え
    @Default(0) final int quizIndex, //問題番号
    @Default(0) final int lapIndex, //何周目
    @Default([]) final List<Quiz> quizList,
    @Default([]) final List<Quiz> knowRememberQuestions,
    @Default([]) final List<Quiz> unKnowRememberQuestions,
  }) = _Create;
}
