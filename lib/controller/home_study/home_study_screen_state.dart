import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/quiz_item.dart';

part 'home_study_screen_state.freezed.dart';

@freezed
class HomeStudyScreenState with _$HomeStudyScreenState {
  const factory HomeStudyScreenState({
    @Default(0) final int quizIndex, //クイズ番号
    @Default([]) final List<QuizItem> quizItemList,
    @Default(QuizItem()) final QuizItem quizItem,
    @Default(0) final int score, //正解数
    @Default(false) final bool isCompleted, //全問正解か
  }) = _Create;
}
