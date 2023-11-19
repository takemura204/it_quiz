// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quizzes _$$_QuizzesFromJson(Map<String, dynamic> json) => _$_Quizzes(
      selectQuizId: json['selectQuizId'] as int? ?? 0,
      quizList: (json['quizList'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      historyQuizList: (json['historyQuizList'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      quizItemList: (json['quizItemList'] as List<dynamic>?)
              ?.map((e) => QuizItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weakQuiz: json['weakQuiz'] == null
          ? null
          : Quiz.fromJson(json['weakQuiz'] as Map<String, dynamic>),
      testQuiz: json['testQuiz'] == null
          ? null
          : Quiz.fromJson(json['testQuiz'] as Map<String, dynamic>),
      quizType: $enumDecodeNullable(_$QuizTypeEnumMap, json['quizType']) ??
          QuizType.study,
      studyType: $enumDecodeNullable(_$StudyTypeEnumMap, json['studyType']) ??
          StudyType.learn,
    );

Map<String, dynamic> _$$_QuizzesToJson(_$_Quizzes instance) =>
    <String, dynamic>{
      'selectQuizId': instance.selectQuizId,
      'quizList': instance.quizList,
      'historyQuizList': instance.historyQuizList,
      'quizItemList': instance.quizItemList,
      'weakQuiz': instance.weakQuiz,
      'testQuiz': instance.testQuiz,
      'quizType': _$QuizTypeEnumMap[instance.quizType]!,
      'studyType': _$StudyTypeEnumMap[instance.studyType]!,
    };

const _$QuizTypeEnumMap = {
  QuizType.study: 'study',
  QuizType.weak: 'weak',
  QuizType.daily: 'daily',
  QuizType.test: 'test',
};

const _$StudyTypeEnumMap = {
  StudyType.learn: 'learn',
  StudyType.choice: 'choice',
};
