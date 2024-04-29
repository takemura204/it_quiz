import 'package:freezed_annotation/freezed_annotation.dart';

import '../notification_time/notification_time.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Auth with _$Auth {
  const factory Auth({
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
    @Default(20) final int dailyGoal,
    NotificationTime? selectNotificationTime,
    @Default(false) final bool isPremium,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
