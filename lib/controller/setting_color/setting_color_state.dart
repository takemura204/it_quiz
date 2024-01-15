import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_color_state.freezed.dart';

@freezed
class SettingColorState with _$SettingColorState {
  const SettingColorState._();

  const factory SettingColorState({
    ThemeData? themeData,
  }) = _SettingColorState;
}
