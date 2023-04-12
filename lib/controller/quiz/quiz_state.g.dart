// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizState _$$_QuizStateFromJson(Map<String, dynamic> json) => _$_QuizState(
      quizId: json['quizId'] as int,
      question: json['question'] as String,
      ans: json['ans'] as String,
      isWeak: json['isWeak'] as bool,
      isJudge: json['isJudge'] as bool,
      choices:
          (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_QuizStateToJson(_$_QuizState instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'question': instance.question,
      'ans': instance.ans,
      'isWeak': instance.isWeak,
      'isJudge': instance.isJudge,
      'choices': instance.choices,
    };
