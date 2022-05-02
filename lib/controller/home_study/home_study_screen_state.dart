import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_study_screen_state.freezed.dart';

@freezed
class HomeStudyScreenState with _$HomeStudyScreenState {
  const factory HomeStudyScreenState({
    @Default(0) final int currentIndex,
  }) = _Create;
}
