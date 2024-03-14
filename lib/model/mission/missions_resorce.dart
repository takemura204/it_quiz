part of 'mission_model.dart';

extension MissionModelEx on MissionModel {
  Mission get defaultMission1 => Mission(
        missionId: 1,
        title: "ログインする",
        exp: 5,
      );

  Mission get defaultMission2 => Mission(
        missionId: 2,
        title: "クイズを10問解く",
        exp: 10,
      );

  Mission get defaultMission3 => Mission(
        missionId: 3,
        title: "今日の目標を達成する",
        exp: 15,
      );

  ///累計ストックバッジ一覧
  List<Mission> get randomMission1 => [
        Mission(
          missionId: 4,
          title: "クイズに10問正解する",
          exp: 10,
        ),
        Mission(
          missionId: 5,
          title: "クイズに15問正解する",
          exp: 15,
        ),
        Mission(
          missionId: 6,
          title: "クイズに20問正解する",
          exp: 20,
        ),
      ];

  List<Mission> get randomMission2 => [
        Mission(
          missionId: 7,
          title: "クイズに全正解する",
          exp: 15,
        ),
        Mission(
          missionId: 8,
          title: "力だめしに挑戦する",
          exp: 15,
        ),
        Mission(
          missionId: 9,
          title: "苦手克服に挑戦する",
          exp: 15,
        ),
      ];
}
