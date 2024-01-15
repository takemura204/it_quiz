import 'package:freezed_annotation/freezed_annotation.dart';

import '../notification_time/notification_time.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    //ユーザー基本情報
    @Default('') final String uid,
    @Default('') final String userName,
    @Default('') final String email,
    @Default('') final String password,
    @Default('') final String gender,
    @Default('') final String birthDay,
    @Default(false) final bool isLogin,
    //ユーザーのカスタム設定
    @Default(0) final int themeId,
    @Default(10) final int dailyGoal,
    NotificationTime? selectNotificationTime,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
