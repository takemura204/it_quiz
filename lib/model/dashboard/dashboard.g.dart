// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dashboard _$$_DashboardFromJson(Map<String, dynamic> json) => _$_Dashboard(
      isLoading: json['isLoading'] as bool? ?? false,
      totalQuizList: (json['totalQuizList'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allDuration: json['allDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['allDuration'] as int),
      allQuizCount: json['allQuizCount'] as int? ?? 0,
      allQuizCorrectCount: json['allQuizCorrectCount'] as int? ?? 0,
      runningDays: json['runningDays'] as int? ?? 0,
      dailyDuration: json['dailyDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['dailyDuration'] as int),
      dailyQuizCount: json['dailyQuizCount'] as int? ?? 0,
      dailyQuizCorrectCount: json['dailyQuizCorrectCount'] as int? ?? 0,
      weeklyDuration: json['weeklyDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['weeklyDuration'] as int),
      weeklyQuizCount: json['weeklyQuizCount'] as int? ?? 0,
      weeklyQuizCorrectCount: json['weeklyQuizCorrectCount'] as int? ?? 0,
      monthlyDuration: json['monthlyDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['monthlyDuration'] as int),
      monthlyQuizCount: json['monthlyQuizCount'] as int? ?? 0,
      monthlyQuizCorrectCount: json['monthlyQuizCorrectCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DashboardToJson(_$_Dashboard instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'totalQuizList': instance.totalQuizList,
      'allDuration': instance.allDuration.inMicroseconds,
      'allQuizCount': instance.allQuizCount,
      'allQuizCorrectCount': instance.allQuizCorrectCount,
      'runningDays': instance.runningDays,
      'dailyDuration': instance.dailyDuration.inMicroseconds,
      'dailyQuizCount': instance.dailyQuizCount,
      'dailyQuizCorrectCount': instance.dailyQuizCorrectCount,
      'weeklyDuration': instance.weeklyDuration.inMicroseconds,
      'weeklyQuizCount': instance.weeklyQuizCount,
      'weeklyQuizCorrectCount': instance.weeklyQuizCorrectCount,
      'monthlyDuration': instance.monthlyDuration.inMicroseconds,
      'monthlyQuizCount': instance.monthlyQuizCount,
      'monthlyQuizCorrectCount': instance.monthlyQuizCorrectCount,
    };
