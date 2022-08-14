import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/quiz_item.dart';

part 'home_review_screen_state.freezed.dart';

@freezed
class HomeReviewScreenState with _$HomeReviewScreenState {
  const factory HomeReviewScreenState({
    @Default(0) final int currentIndex,
    @Default([]) final List<RememberQuiz> reviewQuestions,
    @Default([]) final List<QuizItem> reviewItem,
  }) = _Create;
}
