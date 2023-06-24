// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RankData _$$_RankDataFromJson(Map<String, dynamic> json) => _$_RankData(
      rankId: json['rankId'] as int,
      rankName: json['rankName'] as String,
      levelUpScore: json['levelUpScore'] as int,
      rankLevel: json['rankLevel'] as int,
      score: json['score'] as int,
    );

Map<String, dynamic> _$$_RankDataToJson(_$_RankData instance) =>
    <String, dynamic>{
      'rankId': instance.rankId,
      'rankName': instance.rankName,
      'levelUpScore': instance.levelUpScore,
      'rankLevel': instance.rankLevel,
      'score': instance.score,
    };
