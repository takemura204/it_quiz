// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizItem _$$_QuizItemFromJson(Map<String, dynamic> json) => _$_QuizItem(
      quizId: json['quizId'] as int? ?? 0,
      question: json['question'] as String,
      ans: json['ans'] as String,
      choices:
          (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
      comment: json['comment'] as String,
      isWeak: json['isWeak'] as bool? ?? false,
      isJudge: json['isJudge'] as bool? ?? false,
      isSaved: json['isSaved'] as bool? ?? false,
      lapIndex: json['lapIndex'] as int? ?? 0,
      isPremium: json['isPremium'] as bool? ?? true,
    );

Map<String, dynamic> _$$_QuizItemToJson(_$_QuizItem instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'question': instance.question,
      'ans': instance.ans,
      'choices': instance.choices,
      'comment': instance.comment,
      'isWeak': instance.isWeak,
      'isJudge': instance.isJudge,
      'isSaved': instance.isSaved,
      'lapIndex': instance.lapIndex,
      'isPremium': instance.isPremium,
    };
