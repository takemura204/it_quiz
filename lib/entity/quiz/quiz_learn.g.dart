// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_learn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Create _$$_CreateFromJson(Map<String, dynamic> json) => _$_Create(
      quizId: json['quizId'] as int,
      question: json['question'] as String,
      ans: json['ans'] as String,
      isWeak: json['isWeak'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CreateToJson(_$_Create instance) => <String, dynamic>{
      'quizId': instance.quizId,
      'question': instance.question,
      'ans': instance.ans,
      'isWeak': instance.isWeak,
    };
