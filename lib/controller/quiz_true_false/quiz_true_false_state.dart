import 'package:freezed_annotation/freezed_annotation.dart';

import '../quiz/quiz_state.dart';

part 'quiz_true_false_state.freezed.dart';

@freezed
class QuizTrueFalseScreenState with _$QuizTrueFalseScreenState {
  const QuizTrueFalseScreenState._();
  const factory QuizTrueFalseScreenState({
    @Default(false) final bool isAnsView, //答え表示
    @Default(false) final bool isJudge, //正解判定表示
    @Default(false) final bool isResultScreen, //結果画面表示
    @Default(0) final int quizIndex, //問題番号
    @Default("") final String randomAns, //ランダムな答え
    @Default([]) final List<String> choices, //選択肢
    @Default([]) final List<QuizState> correctList, //正解リスト
    @Default([]) final List<QuizState> incorrectList, //不正解リスト
    @Default([]) final List<QuizState> reviewList, //復習リスト
  }) = _Create;
}
