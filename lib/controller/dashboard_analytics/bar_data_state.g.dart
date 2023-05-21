// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_data_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BarData _$$_BarDataFromJson(Map<String, dynamic> json) => _$_BarData(
      quizData: (json['quizData'] as List<dynamic>)
          .map((e) => QuizState.fromJson(e as Map<String, dynamic>))
          .toList(),
      day: DateTime.parse(json['day'] as String),
    );

Map<String, dynamic> _$$_BarDataToJson(_$_BarData instance) =>
    <String, dynamic>{
      'quizData': instance.quizData,
      'day': instance.day.toIso8601String(),
    };
