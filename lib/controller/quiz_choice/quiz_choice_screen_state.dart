import 'package:freezed_annotation/freezed_annotation.dart';

import '../quiz/quiz_state.dart';
import '../quiz_item/quiz_item_state.dart';

part 'quiz_choice_screen_state.freezed.dart';

@freezed
class QuizChoiceScreenState with _$QuizChoiceScreenState {
  const QuizChoiceScreenState._();
  const factory QuizChoiceScreenState({
    @Default(false) final bool isAnsView, //答え表示
    @Default(false) final bool isJudge, //正解判定
    @Default(false) final bool isResultScreen,
    @Default(0) final int quizIndex, //問題番号
    @Default([]) final List<String> choices, //選択肢
    @Default([]) final List<QuizState> correctList, //正解リスト
    @Default([]) final List<QuizState> incorrectList, //不正解リスト
    @Default([]) final List<QuizState> reviewList, //復習リスト
    final QuizItemState? quizItem,
    @Default([]) final List<QuizItemState> quizItemList,
    @Default(0) final int scoreCount,
  }) = _Create;
}
