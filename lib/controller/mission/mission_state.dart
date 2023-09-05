import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission_state.freezed.dart';

@freezed
class MissionState with _$MissionState {
  const MissionState._();

  factory MissionState({
    @Default(false) bool isLoading,
    @Default('') final String timeLimit,
  }) = _Create;
}
