import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_screen_state.freezed.dart';

@freezed
class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    @Default(0) final int currentTabIndex,
    @Default(0) final int inAppReviewCount,
    @Default(false) final bool isShowInAppReview,
  }) = _MainScreenState;
}
