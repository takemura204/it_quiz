import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/quiz_item/quiz_item.dart';

part 'quiz_choice_screen_state.freezed.dart';

@freezed
class QuizChoiceScreenState with _$QuizChoiceScreenState {
  const QuizChoiceScreenState._();

  const factory QuizChoiceScreenState({
    @Default(false) final bool isAnsView, //答え表示
    @Default(false) final bool isJudge, //正解判定
    @Default(false) final bool isResultScreen,
    @Default(0) final int quizIndex, //問題番号
    @Default(0) final int quizItemIndex, //クイズアイテム番号
    @Default([]) final List<String> choices, //選択肢
    @Default([]) final List<QuizItem> quizItemList, //問題
    @Default(Duration.zero) final Duration duration, // 所要時間
  }) = _Create;
}
