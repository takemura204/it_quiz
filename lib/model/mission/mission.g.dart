// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Mission _$$_MissionFromJson(Map<String, dynamic> json) => _$_Mission(
      docId: json['docId'] as String?,
      missionId: json['missionId'] as int,
      title: json['title'] as String? ?? "",
      exp: json['exp'] as int? ?? 0,
      isReceived: json['isReceived'] as bool? ?? false,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_MissionToJson(_$_Mission instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'missionId': instance.missionId,
      'title': instance.title,
      'exp': instance.exp,
      'isReceived': instance.isReceived,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
