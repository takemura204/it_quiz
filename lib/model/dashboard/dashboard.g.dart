// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dashboard _$$_DashboardFromJson(Map<String, dynamic> json) => _$_Dashboard(
      quizList: (json['quizList'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      todayDuration: json['todayDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['todayDuration'] as int),
      allDuration: json['allDuration'] == null
          ? Duration.zero
          : Duration(microseconds: json['allDuration'] as int),
      todayQuizCount: json['todayQuizCount'] as int? ?? 0,
      allQuizCount: json['allQuizCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DashboardToJson(_$_Dashboard instance) =>
    <String, dynamic>{
      'quizList': instance.quizList,
      'todayDuration': instance.todayDuration.inMicroseconds,
      'allDuration': instance.allDuration.inMicroseconds,
      'todayQuizCount': instance.todayQuizCount,
      'allQuizCount': instance.allQuizCount,
    };
