// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizItem _$$_QuizItemFromJson(Map<String, dynamic> json) => _$_QuizItem(
      quizId: json['quizId'] as int? ?? 0,
      word: json['word'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      question: json['question'] as String? ?? '',
      ans: json['ans'] as String? ?? '',
      choices: (json['choices'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      source: json['source'] as String? ?? '',
      isWeak: json['isWeak'] as bool? ?? false,
      status: $enumDecodeNullable(_$QuizStatusTypeEnumMap, json['status']) ??
          QuizStatusType.unlearned,
      importance: $enumDecodeNullable(
              _$QuizImportanceTypeEnumMap, json['importance']) ??
          QuizImportanceType.normal,
      isSaved: json['isSaved'] as bool? ?? false,
      lapIndex: json['lapIndex'] as int? ?? 0,
      isPremium: json['isPremium'] as bool? ?? true,
    );

Map<String, dynamic> _$$_QuizItemToJson(_$_QuizItem instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'word': instance.word,
      'comment': instance.comment,
      'question': instance.question,
      'ans': instance.ans,
      'choices': instance.choices,
      'source': instance.source,
      'isWeak': instance.isWeak,
      'status': _$QuizStatusTypeEnumMap[instance.status]!,
      'importance': _$QuizImportanceTypeEnumMap[instance.importance]!,
      'isSaved': instance.isSaved,
      'lapIndex': instance.lapIndex,
      'isPremium': instance.isPremium,
    };

const _$QuizStatusTypeEnumMap = {
  QuizStatusType.correct: 'correct',
  QuizStatusType.incorrect: 'incorrect',
  QuizStatusType.learned: 'learned',
  QuizStatusType.unlearned: 'unlearned',
};

const _$QuizImportanceTypeEnumMap = {
  QuizImportanceType.high: 'high',
  QuizImportanceType.normal: 'normal',
  QuizImportanceType.low: 'low',
  QuizImportanceType.none: 'none',
};
