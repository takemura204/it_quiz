import 'package:freezed_annotation/freezed_annotation.dart';

import '../quiz/quiz_state.dart';
import '../quiz_item/quiz_item_state.dart';

part 'home_review_screen_state.freezed.dart';

@freezed
class HomeReviewScreenState with _$HomeReviewScreenState {
  const factory HomeReviewScreenState({
    @Default(0) final int currentIndex,
    @Default([]) final List<QuizItemState> reviewItem,
    @Default([]) final List<QuizState> quizList,
  }) = _Create;
}
