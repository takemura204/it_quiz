// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Auth _$$_AuthFromJson(Map<String, dynamic> json) => _$_Auth(
      uid: json['uid'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      birthDay: json['birthDay'] as String? ?? '',
      isLogin: json['isLogin'] as bool? ?? false,
      themeId: json['themeId'] as int? ?? 0,
      dailyGoal: json['dailyGoal'] as int? ?? 10,
      selectNotificationTime: json['selectNotificationTime'] == null
          ? null
          : NotificationTime.fromJson(
              json['selectNotificationTime'] as Map<String, dynamic>),
      isPremium: json['isPremium'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AuthToJson(_$_Auth instance) => <String, dynamic>{
      'uid': instance.uid,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'birthDay': instance.birthDay,
      'isLogin': instance.isLogin,
      'themeId': instance.themeId,
      'dailyGoal': instance.dailyGoal,
      'selectNotificationTime': instance.selectNotificationTime,
      'isPremium': instance.isPremium,
    };
