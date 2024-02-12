// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quiz _$$_QuizFromJson(Map<String, dynamic> json) => _$_Quiz(
      id: json['id'] as int? ?? 0,
      categoryId: json['categoryId'] as int,
      category: json['category'] as String,
      title: json['title'] as String,
      quizItemList: (json['quizItemList'] as List<dynamic>)
          .map((e) => QuizItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeStamp: json['timeStamp'] == null
          ? null
          : DateTime.parse(json['timeStamp'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
      correctNum: json['correctNum'] as int? ?? 0,
      duration: json['duration'] == null
          ? Duration.zero
          : Duration(microseconds: json['duration'] as int),
      studyType: $enumDecodeNullable(_$StudyTypeEnumMap, json['studyType']) ??
          StudyType.learn,
    );

Map<String, dynamic> _$$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'category': instance.category,
      'title': instance.title,
      'quizItemList': instance.quizItemList,
      'timeStamp': instance.timeStamp?.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'correctNum': instance.correctNum,
      'duration': instance.duration.inMicroseconds,
      'studyType': _$StudyTypeEnumMap[instance.studyType]!,
    };

const _$StudyTypeEnumMap = {
  StudyType.learn: 'learn',
  StudyType.choice: 'choice',
};
