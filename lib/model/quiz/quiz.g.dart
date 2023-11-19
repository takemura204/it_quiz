// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quiz _$$_QuizFromJson(Map<String, dynamic> json) => _$_Quiz(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      category: json['category'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
      quizItemList: (json['quizItemList'] as List<dynamic>)
          .map((e) => QuizItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctNum: json['correctNum'] as int,
      timeStamp: json['timeStamp'] == null
          ? null
          : DateTime.parse(json['timeStamp'] as String),
      duration: Duration(microseconds: json['duration'] as int),
      studyType: $enumDecode(_$StudyTypeEnumMap, json['studyType']),
    );

Map<String, dynamic> _$$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'category': instance.category,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'quizItemList': instance.quizItemList,
      'correctNum': instance.correctNum,
      'timeStamp': instance.timeStamp?.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
      'studyType': _$StudyTypeEnumMap[instance.studyType]!,
    };

const _$StudyTypeEnumMap = {
  StudyType.learn: 'learn',
  StudyType.choice: 'choice',
};
