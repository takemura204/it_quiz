import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_setting_state.freezed.dart';

@freezed
class HomeSettingState with _$HomeSettingState {
  const factory HomeSettingState({
    @Default(10) final int selectedQuizCountGoal,
  }) = _HomeSettingState;
}
