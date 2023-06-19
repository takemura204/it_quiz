import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    //ユーザー情報
    @Default('') final String uid,
    @Default('') final String userName,
    @Default(null) final File? userImage,
    @Default('') final String email,
    @Default('') final String password,
    @Default('') final String gender,
    @Default('') final String birthDay,
    @Default(false) final bool isLogin,

    //その他
    @Default('') final String selectGender,
    @Default(0) final int currentImageIndex,
    @Default('') final String errorText,
    @Default(true) final bool isObscure,
    @Default(false) final bool isValidUserName,
    @Default(false) final bool isValidEmail,
    @Default(false) final bool isSafetyPass,
    @Default(false) final bool isSucceeded,
    @Default(false) final bool hasError,
    @Default(false) final bool isNotTap,
    @Default(false) final bool isNotSignUpCompleted,
    @Default(AuthActiveType.signUp) final AuthActiveType activeType,
  }) = _Create;
}

enum AuthActiveType {
  signUp,
  signIn,
  signOut,
  delete,
  changing,
  update,
}
