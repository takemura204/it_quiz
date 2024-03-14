// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rank _$$_RankFromJson(Map<String, dynamic> json) => _$_Rank(
      rankId: json['rankId'] as int,
      level: json['level'] as int,
      score: json['score'] as int,
      rankName: json['rankName'] as String? ?? "",
      levelUpScore: json['levelUpScore'] as int? ?? 0,
      uid: json['uid'] as String? ?? "",
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
    );

Map<String, dynamic> _$$_RankToJson(_$_Rank instance) => <String, dynamic>{
      'rankId': instance.rankId,
      'level': instance.level,
      'score': instance.score,
      'rankName': instance.rankName,
      'levelUpScore': instance.levelUpScore,
      'uid': instance.uid,
      'updateAt': instance.updateAt?.toIso8601String(),
    };
