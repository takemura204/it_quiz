import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/resource/quiz_item/review_resource.dart';

import '../quiz_item/quiz_item_state.dart';

part 'home_review_screen_state.freezed.dart';

@freezed
class HomeReviewScreenState with _$HomeReviewScreenState {
  const factory HomeReviewScreenState({
    @Default([]) final List<QuizItemState> reviewItem,
    @Default(weakItem) final QuizItemState weakQuiz, //苦手克服
    @Default(dailyItem) final QuizItemState dailyQuiz, //今日のクイズ
    @Default(testItem) final QuizItemState testQuiz, //全てのクイズ
    @Default(0) final int testScore, //全てのクイズ
    @Default(false) bool isSelected,
    @Default([]) final List<String> testGroup,
    @Default(10) final int testLength,
  }) = _Create;
}
