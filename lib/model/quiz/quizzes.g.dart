// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quizzes _$$_QuizzesFromJson(Map<String, dynamic> json) => _$_Quizzes(
      quizList: (json['quizList'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userQuizList: (json['userQuizList'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weakQuiz: json['weakQuiz'] == null
          ? null
          : Quiz.fromJson(json['weakQuiz'] as Map<String, dynamic>),
      dailyQuiz: json['dailyQuiz'] == null
          ? null
          : Quiz.fromJson(json['dailyQuiz'] as Map<String, dynamic>),
      testQuiz: json['testQuiz'] == null
          ? null
          : Quiz.fromJson(json['testQuiz'] as Map<String, dynamic>),
      dailyQuizItem: (json['dailyQuizItem'] as List<dynamic>?)
              ?.map((e) => QuizItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weakQuizItem: (json['weakQuizItem'] as List<dynamic>?)
              ?.map((e) => QuizItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      testQuizItem: (json['testQuizItem'] as List<dynamic>?)
              ?.map((e) => QuizItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectQuizIndex: json['selectQuizIndex'] as int? ?? 0,
      quizType: $enumDecodeNullable(_$QuizTypeEnumMap, json['quizType']) ??
          QuizType.study,
    );

Map<String, dynamic> _$$_QuizzesToJson(_$_Quizzes instance) =>
    <String, dynamic>{
      'quizList': instance.quizList,
      'userQuizList': instance.userQuizList,
      'weakQuiz': instance.weakQuiz,
      'dailyQuiz': instance.dailyQuiz,
      'testQuiz': instance.testQuiz,
      'dailyQuizItem': instance.dailyQuizItem,
      'weakQuizItem': instance.weakQuizItem,
      'testQuizItem': instance.testQuizItem,
      'selectQuizIndex': instance.selectQuizIndex,
      'quizType': _$QuizTypeEnumMap[instance.quizType]!,
    };

const _$QuizTypeEnumMap = {
  QuizType.study: 'study',
  QuizType.weak: 'weak',
  QuizType.daily: 'daily',
  QuizType.test: 'test',
};
