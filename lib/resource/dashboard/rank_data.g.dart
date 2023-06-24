// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RankData _$$_RankDataFromJson(Map<String, dynamic> json) => _$_RankData(
      rankId: json['rankId'] as int,
      rankName: json['rankName'] as String,
      levelScore: json['levelScore'] as int,
      level: json['level'] as int,
      rankScore: json['rankScore'] as int,
    );

Map<String, dynamic> _$$_RankDataToJson(_$_RankData instance) =>
    <String, dynamic>{
      'rankId': instance.rankId,
      'rankName': instance.rankName,
      'levelScore': instance.levelScore,
      'level': instance.level,
      'rankScore': instance.rankScore,
    };
