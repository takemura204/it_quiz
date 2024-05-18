import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_state.freezed.dart';

@freezed
class TutorialState with _$TutorialState {
  const TutorialState._();

  factory TutorialState({
    @Default(false) final bool isShowTutorialModal,
    @Default(false) bool isShowTarget1,
  }) = _TutorialState;
}
