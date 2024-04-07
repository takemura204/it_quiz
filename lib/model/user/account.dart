import 'package:freezed_annotation/freezed_annotation.dart';

import '../notification_time/notification_time.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
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
    @Default(false) final bool isPremium,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
