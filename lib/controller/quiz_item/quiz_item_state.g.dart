// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_item_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizItemState _$$_QuizItemStateFromJson(Map<String, dynamic> json) =>
    _$_QuizItemState(
      id: json['id'] as int,
      group: json['group'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
      quizList: (json['quizList'] as List<dynamic>)
          .map((e) => QuizState.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: json['score'] as int,
      timeStamp: json['timeStamp'] == null
          ? null
          : DateTime.parse(json['timeStamp'] as String),
    );

Map<String, dynamic> _$$_QuizItemStateToJson(_$_QuizItemState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group': instance.group,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'quizList': instance.quizList,
      'score': instance.score,
      'timeStamp': instance.timeStamp?.toIso8601String(),
    };
