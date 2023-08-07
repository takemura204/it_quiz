// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizItem _$$_QuizItemFromJson(Map<String, dynamic> json) => _$_QuizItem(
      quizId: json['quizId'] as int,
      question: json['question'] as String,
      ans: json['ans'] as String,
      comment: json['comment'] as String,
      isWeak: json['isWeak'] as bool,
      isJudge: json['isJudge'] as bool,
      choices:
          (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_QuizItemToJson(_$_QuizItem instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'question': instance.question,
      'ans': instance.ans,
      'comment': instance.comment,
      'isWeak': instance.isWeak,
      'isJudge': instance.isJudge,
      'choices': instance.choices,
    };
