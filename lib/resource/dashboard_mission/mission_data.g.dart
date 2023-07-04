// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MissionData _$$_MissionDataFromJson(Map<String, dynamic> json) =>
    _$_MissionData(
      missionId: json['missionId'] as int,
      missionName: json['missionName'] as String,
      score: json['score'] as int,
      status: $enumDecode(_$MissionStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_MissionDataToJson(_$_MissionData instance) =>
    <String, dynamic>{
      'missionId': instance.missionId,
      'missionName': instance.missionName,
      'score': instance.score,
      'status': _$MissionStatusEnumMap[instance.status]!,
    };

const _$MissionStatusEnumMap = {
  MissionStatus.progress: 'progress',
  MissionStatus.complete: 'complete',
  MissionStatus.receive: 'receive',
};
