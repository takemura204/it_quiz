import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/quiz_item.dart';

part 'quiz_true_false_state.freezed.dart';

@freezed
class QuizTrueFalseScreenState with _$QuizTrueFalseScreenState {
  const QuizTrueFalseScreenState._();
  const factory QuizTrueFalseScreenState({
    @Default(false) final bool isAnsView, //答え表示
    @Default(false) final bool isJudge, //正解判定
    @Default(false) final bool isResultScreen,
    @Default(0) final int quizIndex, //問題番号
    @Default([]) final List<String> choices, //選択肢
    @Default([]) final List<ChoiceQuiz> correctList, //正解リスト
    @Default([]) final List<ChoiceQuiz> incorrectList, //不正解リスト
    @Default([]) final List<ChoiceQuiz> reviewList, //復習リスト
  }) = _Create;
}
