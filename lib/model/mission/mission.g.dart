// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Mission _$$_MissionFromJson(Map<String, dynamic> json) => _$_Mission(
      docId: json['docId'] as String?,
      missionId: json['missionId'] as int,
      title: json['title'] as String? ?? "",
      point: json['point'] as int? ?? 0,
      isReceived: json['isReceived'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_MissionToJson(_$_Mission instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'missionId': instance.missionId,
      'title': instance.title,
      'point': instance.point,
      'isReceived': instance.isReceived,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
