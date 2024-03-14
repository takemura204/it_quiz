import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_contact_state.freezed.dart';

@freezed
class SettingContactState with _$SettingContactState {
  const factory SettingContactState({
    @Default(false) bool isLoading,
    @Default(true) bool isConnected,
  }) = _SettingContactState;
}
