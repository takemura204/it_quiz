import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/quiz_item.dart';

part 'quiz_choice_screen_state.freezed.dart';

@freezed
class QuizChoiceScreenState with _$QuizChoiceScreenState {
  const QuizChoiceScreenState._();
  const factory QuizChoiceScreenState({
    @Default(false) final bool isAnsView, //答え表示
    @Default(false) final bool isJudge, //正解判定
    @Default(0) final int quizIndex, //問題番号
    @Default([]) final List<String> choices, //選択肢
    @Default([]) final List<ChoiceQuiz> choicesQuiz, //クイズ
    @Default([]) final List<ChoiceQuiz> reviewList, //復習リスト
  }) = _Create;
}
