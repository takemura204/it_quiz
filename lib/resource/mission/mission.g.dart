// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Mission _$$_MissionFromJson(Map<String, dynamic> json) => _$_Mission(
      docId: json['docId'] as String?,
      missionId: json['missionId'] as int,
      title: json['title'] as String,
      point: json['point'] as int,
      isDone: json['isDone'] as bool? ?? false,
      isReceived: json['isReceived'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_MissionToJson(_$_Mission instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'missionId': instance.missionId,
      'title': instance.title,
      'point': instance.point,
      'isDone': instance.isDone,
      'isReceived': instance.isReceived,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
