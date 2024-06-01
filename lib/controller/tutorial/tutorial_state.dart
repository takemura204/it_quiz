import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_state.freezed.dart';

@freezed
class TutorialState with _$TutorialState {
  const TutorialState._();

  factory TutorialState({
    @Default(false) final bool isTutorialRestart,
    @Default(false) final bool isShowHomeTutorial,
    @Default(false) final bool isShowLearnTutorial,
    @Default(false) final bool isShowLearnResultTutorial,
    @Default(false) final bool isShowLearnTutorialModal,
    @Default(false) final bool isShowSwipeLeftAnimation,
    @Default(false) final bool isShowSwipeRightAnimation,
    @Default(false) final bool isShowTapAnimation,
  }) = _TutorialState;
}
