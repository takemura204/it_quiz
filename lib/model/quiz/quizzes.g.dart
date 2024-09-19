// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quizzes _$$_QuizzesFromJson(Map<String, dynamic> json) => _$_Quizzes(
      isLoading: json['isLoading'] as bool? ?? false,
      quizIndex: json['quizIndex'] as int? ?? 0,
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
      randomQuiz: json['randomQuiz'] == null
          ? null
          : Quiz.fromJson(json['randomQuiz'] as Map<String, dynamic>),
      quizType: $enumDecodeNullable(_$QuizStyleTypeEnumMap, json['quizType']) ??
          QuizStyleType.study,
      studyType: $enumDecodeNullable(_$StudyTypeEnumMap, json['studyType']) ??
          StudyType.study,
    );

Map<String, dynamic> _$$_QuizzesToJson(_$_Quizzes instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'quizIndex': instance.quizIndex,
      'quizList': instance.quizList,
      'historyQuizList': instance.historyQuizList,
      'quizItemList': instance.quizItemList,
      'weakQuiz': instance.weakQuiz,
      'randomQuiz': instance.randomQuiz,
      'quizType': _$QuizStyleTypeEnumMap[instance.quizType]!,
      'studyType': _$StudyTypeEnumMap[instance.studyType]!,
    };

const _$QuizStyleTypeEnumMap = {
  QuizStyleType.study: 'study',
  QuizStyleType.weak: 'weak',
  QuizStyleType.daily: 'daily',
  QuizStyleType.random: 'random',
};

const _$StudyTypeEnumMap = {
  StudyType.study: 'study',
  StudyType.learn: 'learn',
  StudyType.choice: 'choice',
};
