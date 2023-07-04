import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission_data.freezed.dart';
part 'mission_data.g.dart';

@freezed
class MissionData with _$MissionData {
  const factory MissionData({
    required final int missionId, //ミッションID
    required final String missionName, //ミッションの名前
    required final int score, //獲得スコア
    required final MissionStatus status, //獲得スコア
  }) = _MissionData;
  factory MissionData.fromJson(Map<String, dynamic> json) =>
      _$MissionDataFromJson(json);
}

enum MissionStatus {
  progress,
  complete,
  receive,
}

final mission1 = [
  const MissionData(
      missionId: 1,
      missionName: "クイズを10問解く",
      score: 10,
      status: MissionStatus.progress),
  const MissionData(
      missionId: 2,
      missionName: "クイズを15問解く",
      score: 15,
      status: MissionStatus.progress),
  const MissionData(
      missionId: 3,
      missionName: "クイズを20問解く",
      score: 20,
      status: MissionStatus.progress),
  const MissionData(
      missionId: 4,
      missionName: "クイズを30問解く",
      score: 30,
      status: MissionStatus.progress),
];

final mission2 = [
  const MissionData(
      missionId: 5,
      missionName: "クイズに5問正解する",
      score: 5,
      status: MissionStatus.progress),
  const MissionData(
      missionId: 6,
      missionName: "クイズに10問正解する",
      score: 10,
      status: MissionStatus.progress),
  const MissionData(
      missionId: 7,
      missionName: "クイズに15問正解する",
      score: 15,
      status: MissionStatus.progress),
  const MissionData(
      missionId: 8,
      missionName: "クイズに20問正解する",
      score: 20,
      status: MissionStatus.progress),
];

final mission3 = [
  const MissionData(
      missionId: 9,
      missionName: "今日のクイズに挑戦する",
      score: 15,
      status: MissionStatus.progress),
  const MissionData(
      missionId: 10,
      missionName: "クイズに全正解する",
      score: 15,
      status: MissionStatus.progress),
  const MissionData(
      missionId: 11,
      missionName: "力だめしに挑戦する",
      score: 15,
      status: MissionStatus.progress),
  const MissionData(
      missionId: 12,
      missionName: "苦手克服に挑戦する",
      score: 15,
      status: MissionStatus.progress),
];
