import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_state.freezed.dart';

@freezed
class TutorialState with _$TutorialState {
  const TutorialState._();

  factory TutorialState({
    @Default(false) final bool isShowTutorialModal,
    @Default(false) bool isShowHomeTutorial,
    @Default(false) bool isShowHomeTutorialDone,
    @Default(false) bool isShowLearnTutorial,
    @Default(false) bool isShowLearnTutorialModal,
    @Default(false) bool isShowSwipeLeftAnimation,
    @Default(false) bool isShowSwipeRightAnimation,
    @Default(false) bool isShowTapAnimation,
  }) = _TutorialState;
}
