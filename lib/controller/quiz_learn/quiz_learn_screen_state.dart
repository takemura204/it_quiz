import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/quiz_item/quiz_item.dart';

part 'quiz_learn_screen_state.freezed.dart';

@freezed
class QuizLearnScreenState with _$QuizLearnScreenState {
  const QuizLearnScreenState._();
  const factory QuizLearnScreenState({
    @Default(false) final bool isAnsView, //正解画面切り替え
    @Default(false) final bool isResultScreen, //結果画面切り替え
    @Default(0) final int quizIndex, //問題番号
    @Default(0) final int lapIndex, //何周目
    @Default([]) final List<QuizItem> quizList,
    @Default([]) final List<QuizItem> knowQuizList,
    @Default([]) final List<QuizItem> unKnowQuizList,
  }) = _Create;
}
