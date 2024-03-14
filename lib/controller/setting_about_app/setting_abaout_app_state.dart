import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_abaout_app_state.freezed.dart';

@freezed
class SettingAboutAppState with _$SettingAboutAppState {
  const factory SettingAboutAppState({
    @Default(false) bool isLoading,
  }) = _SettingAboutAppState;
}
