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
      allQuizCorrectCount: json['allQuizCorrectCount'] as int? ?? 0,
      runningDays: json['runningDays'] as int? ?? 0,
      dailyDuration: json['dailyDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['dailyDuration'] as int),
      dailyQuizCount: json['dailyQuizCount'] as int? ?? 0,
      dailyQuizCorrectCount: json['dailyQuizCorrectCount'] as int? ?? 0,
      periodQuizList: (json['periodQuizList'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      startPeriodRange: json['startPeriodRange'] == null
          ? null
          : DateTime.parse(json['startPeriodRange'] as String),
      endPeriodRange: json['endPeriodRange'] == null
          ? null
          : DateTime.parse(json['endPeriodRange'] as String),
      periodDays: (json['periodDays'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
      periodQuizCounts: (json['periodQuizCounts'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      periodQuizTotal: json['periodQuizTotal'] as int? ?? 0,
      periodDuration: (json['periodDuration'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      periodDurationTotal: json['periodDurationTotal'] as int? ?? 0,
      weekOffset: json['weekOffset'] as int? ?? 0,
      monthOffset: json['monthOffset'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DashboardToJson(_$_Dashboard instance) =>
    <String, dynamic>{
      'totalQuizList': instance.totalQuizList,
      'allDuration': instance.allDuration.inMicroseconds,
      'allQuizCount': instance.allQuizCount,
      'allQuizCorrectCount': instance.allQuizCorrectCount,
      'runningDays': instance.runningDays,
      'dailyDuration': instance.dailyDuration.inMicroseconds,
      'dailyQuizCount': instance.dailyQuizCount,
      'dailyQuizCorrectCount': instance.dailyQuizCorrectCount,
      'periodQuizList': instance.periodQuizList,
      'startPeriodRange': instance.startPeriodRange?.toIso8601String(),
      'endPeriodRange': instance.endPeriodRange?.toIso8601String(),
      'periodDays':
          instance.periodDays.map((e) => e.toIso8601String()).toList(),
      'periodQuizCounts': instance.periodQuizCounts,
      'periodQuizTotal': instance.periodQuizTotal,
      'periodDuration': instance.periodDuration,
      'periodDurationTotal': instance.periodDurationTotal,
      'weekOffset': instance.weekOffset,
      'monthOffset': instance.monthOffset,
    };
