// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dashboard _$$_DashboardFromJson(Map<String, dynamic> json) => _$_Dashboard(
      totalQuizList: (json['totalQuizList'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allDuration: json['allDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['allDuration'] as int),
      allQuizCount: json['allQuizCount'] as int? ?? 0,
      runningDays: json['runningDays'] as int? ?? 0,
      dailyDuration: json['dailyDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['dailyDuration'] as int),
      dailyQuizCount: json['dailyQuizCount'] as int? ?? 0,
      weeklyQuizList: (json['weeklyQuizList'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      startWeekRange: json['startWeekRange'] == null
          ? null
          : DateTime.parse(json['startWeekRange'] as String),
      endWeekRange: json['endWeekRange'] == null
          ? null
          : DateTime.parse(json['endWeekRange'] as String),
      weekDays: (json['weekDays'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
      weekOffset: json['weekOffset'] as int? ?? 0,
      weeklyQuizCounts: (json['weeklyQuizCounts'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      weeklyQuizTotal: json['weeklyQuizTotal'] as int? ?? 0,
      weeklyDuration: (json['weeklyDuration'] as List<dynamic>?)
              ?.map((e) => Duration(microseconds: e as int))
              .toList() ??
          const [],
      weeklyDurationTotal: json['weeklyDurationTotal'] == null
          ? Duration.zero
          : Duration(microseconds: json['weeklyDurationTotal'] as int),
      monthlyQuizList: (json['monthlyQuizList'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      startMonthRange: json['startMonthRange'] == null
          ? null
          : DateTime.parse(json['startMonthRange'] as String),
      endMonthRange: json['endMonthRange'] == null
          ? null
          : DateTime.parse(json['endMonthRange'] as String),
      monthDays: (json['monthDays'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
      monthQuizCounts: (json['monthQuizCounts'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      monthQuizTotal: json['monthQuizTotal'] as int? ?? 0,
      monthOffset: json['monthOffset'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DashboardToJson(_$_Dashboard instance) =>
    <String, dynamic>{
      'totalQuizList': instance.totalQuizList,
      'allDuration': instance.allDuration.inMicroseconds,
      'allQuizCount': instance.allQuizCount,
      'runningDays': instance.runningDays,
      'dailyDuration': instance.dailyDuration.inMicroseconds,
      'dailyQuizCount': instance.dailyQuizCount,
      'weeklyQuizList': instance.weeklyQuizList,
      'startWeekRange': instance.startWeekRange?.toIso8601String(),
      'endWeekRange': instance.endWeekRange?.toIso8601String(),
      'weekDays': instance.weekDays.map((e) => e.toIso8601String()).toList(),
      'weekOffset': instance.weekOffset,
      'weeklyQuizCounts': instance.weeklyQuizCounts,
      'weeklyQuizTotal': instance.weeklyQuizTotal,
      'weeklyDuration':
          instance.weeklyDuration.map((e) => e.inMicroseconds).toList(),
      'weeklyDurationTotal': instance.weeklyDurationTotal.inMicroseconds,
      'monthlyQuizList': instance.monthlyQuizList,
      'startMonthRange': instance.startMonthRange?.toIso8601String(),
      'endMonthRange': instance.endMonthRange?.toIso8601String(),
      'monthDays': instance.monthDays.map((e) => e.toIso8601String()).toList(),
      'monthQuizCounts': instance.monthQuizCounts,
      'monthQuizTotal': instance.monthQuizTotal,
      'monthOffset': instance.monthOffset,
    };
