import 'package:flutter/material.dart';
// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_color_state.freezed.dart';

@freezed
class SettingColorState with _$SettingColorState {
  SettingColorState._();
  factory SettingColorState({
    ThemeData? themeData,
    MaterialColor? mainColor,
    @Default(0) final int themeId,
    @Default(false) final bool isLoading,
  }) = _Create;
}
