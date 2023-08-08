import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_review_screen_state.freezed.dart';

@freezed
class HomeReviewScreenState with _$HomeReviewScreenState {
   factory HomeReviewScreenState({
    @Default(false) bool isSelected,
    @Default([]) final List<String> testGroup,
    @Default(10) final int selectedTestLength,
    @Default(0) final int runningDay, //継続日数
  }) = _Create;
  HomeReviewScreenState._();
}