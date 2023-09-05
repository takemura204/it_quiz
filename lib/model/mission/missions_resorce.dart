part of 'mission_model.dart';

extension MissionModelEx on MissionModel {
  Mission get defaultMission1 => Mission(
        missionId: 'login',
        title: "ログインする",
        point: 5,
      );

  Mission get defaultMission2 => Mission(
        missionId: 'study-10',
        title: "クイズを10問解く",
        point: 10,
      );

  Mission get defaultMission3 => Mission(
        missionId: 'goal-achieve',
        title: "今日の目標を達成する",
        point: 15,
        isReceived: true,
      );

  ///累計ストックバッジ一覧
  List<Mission> get randomMission1 => [
        Mission(
          missionId: 'correct-10',
          title: "クイズに10問正解する",
          point: 10,
        ),
        Mission(
          missionId: 'correct-15',
          title: "クイズに15問正解する",
          point: 15,
        ),
        Mission(
          missionId: 'correct-20',
          title: "クイズに20問正解する",
          point: 20,
        ),
      ];

  List<Mission> get randomMission2 => [
        Mission(
          missionId: 'study-complete',
          title: "クイズに全正解する",
          point: 15,
        ),
        Mission(
          missionId: 'test-challenge',
          title: "力だめしに挑戦する",
          point: 15,
        ),
        Mission(
          missionId: 'weak-challenge',
          title: "苦手克服に挑戦する",
          point: 15,
        ),
      ];
}
