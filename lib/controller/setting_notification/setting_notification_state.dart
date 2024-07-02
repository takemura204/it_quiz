import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_notification_state.freezed.dart';

@freezed
class SettingNotificationState with _$SettingNotificationState {
  const SettingNotificationState._();

  const factory SettingNotificationState({
    @Default(false) final bool isLoading,
    final bool? isNotification,
  }) = _SettingNotificationState;
}
