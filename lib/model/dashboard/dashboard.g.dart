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
      dailyDuration: json['dailyDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['dailyDuration'] as int),
      allDuration: json['allDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['allDuration'] as int),
      dailyQuizCount: json['dailyQuizCount'] as int? ?? 0,
      allQuizCount: json['allQuizCount'] as int? ?? 0,
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
      weeklyQuizCounts: (json['weeklyQuizCounts'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      weeklyQuizTotal: json['weeklyQuizTotal'] as int? ?? 0,
      selectedXIndex: json['selectedXIndex'] as int? ?? -1,
      weekOffset: json['weekOffset'] as int? ?? 0,
      monthOffset: json['monthOffset'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DashboardToJson(_$_Dashboard instance) =>
    <String, dynamic>{
      'totalQuizList': instance.totalQuizList,
      'dailyDuration': instance.dailyDuration.inMicroseconds,
      'allDuration': instance.allDuration.inMicroseconds,
      'dailyQuizCount': instance.dailyQuizCount,
      'allQuizCount': instance.allQuizCount,
      'weeklyQuizList': instance.weeklyQuizList,
      'startWeekRange': instance.startWeekRange?.toIso8601String(),
      'endWeekRange': instance.endWeekRange?.toIso8601String(),
      'weekDays': instance.weekDays.map((e) => e.toIso8601String()).toList(),
      'weeklyQuizCounts': instance.weeklyQuizCounts,
      'weeklyQuizTotal': instance.weeklyQuizTotal,
      'selectedXIndex': instance.selectedXIndex,
      'weekOffset': instance.weekOffset,
      'monthOffset': instance.monthOffset,
    };
