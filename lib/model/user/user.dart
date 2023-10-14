import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/user_custom/user_custom.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    //ユーザー情報
    @Default('') final String uid,
    @Default('') final String userName,
    @Default(null) final File? userImage,
    @Default('') final String email,
    @Default('') final String password,
    @Default('') final String gender,
    @Default('') final String birthDay,
    @Default(false) final bool isLogin,
    @Default(UserCustom()) final UserCustom userCustom,
  }) = _User;
}
