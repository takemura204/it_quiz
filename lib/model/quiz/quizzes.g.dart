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
      quizItemList: (json['quizItemList'] as List<dynamic>?)
              ?.map((e) => QuizItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dailyQuiz: json['dailyQuiz'] == null
          ? initDailyQuiz
          : Quiz.fromJson(json['dailyQuiz'] as Map<String, dynamic>),
      weakQuiz: json['weakQuiz'] == null
          ? initWeakQuiz
          : Quiz.fromJson(json['weakQuiz'] as Map<String, dynamic>),
      testQuiz: json['testQuiz'] == null
          ? initTestQuiz
          : Quiz.fromJson(json['testQuiz'] as Map<String, dynamic>),
      selectQuizIndex: json['selectQuizIndex'] as int? ?? 0,
      quizType: $enumDecodeNullable(_$QuizTypeEnumMap, json['quizType']) ??
          QuizType.study,
    );

Map<String, dynamic> _$$_QuizzesToJson(_$_Quizzes instance) =>
    <String, dynamic>{
      'quizList': instance.quizList,
      'quizItemList': instance.quizItemList,
      'dailyQuiz': instance.dailyQuiz,
      'weakQuiz': instance.weakQuiz,
      'testQuiz': instance.testQuiz,
      'selectQuizIndex': instance.selectQuizIndex,
      'quizType': _$QuizTypeEnumMap[instance.quizType]!,
    };

const _$QuizTypeEnumMap = {
  QuizType.study: 'study',
  QuizType.weak: 'weak',
  QuizType.daily: 'daily',
  QuizType.test: 'test',
};
