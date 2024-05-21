import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lottie/lottie.dart';

part 'tutorial_state.freezed.dart';

@freezed
class TutorialState with _$TutorialState {
  const TutorialState._();

  factory TutorialState({
    @Default(false) final bool isShowTutorialModal,
    @Default(false) bool isShowHomeTutorial,
    @Default(false) bool isShowLearnTutorial,
    @Default(false) bool isShowTarget3,
    @Default(false) bool isShowSwipeLeftAnimation,
    @Default(false) bool isShowSwipeRightAnimation,
    @Default(false) bool isShowTapAnimation,
  }) = _TutorialState;
}
