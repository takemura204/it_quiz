// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rank _$$_RankFromJson(Map<String, dynamic> json) => _$_Rank(
      rankId: json['rankId'] as int,
      rankName: json['rankName'] as String,
      levelUpScore: json['levelUpScore'] as int,
      rankLevel: json['rankLevel'] as int,
      score: json['score'] as int,
    );

Map<String, dynamic> _$$_RankToJson(_$_Rank instance) => <String, dynamic>{
      'rankId': instance.rankId,
      'rankName': instance.rankName,
      'levelUpScore': instance.levelUpScore,
      'rankLevel': instance.rankLevel,
      'score': instance.score,
    };
