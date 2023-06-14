import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_screen_state.freezed.dart';

@freezed
class AuthScreenState with _$AuthScreenState {
  const factory AuthScreenState({
    //ユーザー情報
    @Default('') final String uid,
    @Default('ゲスト') final String userName,
    @Default(null) final File? userImage,
    @Default('') final String email,
    @Default('') final String password,
    @Default('') final String gender,
    final DateTime? birthDay,
    //その他
    @Default('') final String selectGender,
    DateTime? selectedBirthDay,
    @Default(0) final int currentImageIndex,
    @Default('') final String errorText,
    @Default(true) final bool isObscure,
    @Default(false) final bool isValidUserName,
    @Default(false) final bool isValidEmail,
    @Default(false) final bool isSafetyPass,
    @Default(false) final bool isSucceeded,
    @Default(false) final bool hasError,
    @Default(false) final bool isNotTap,
  }) = _Create;
}
