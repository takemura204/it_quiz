part of 'mission_model.dart';

extension MissionModelEx on MissionModel {
  ///累計ストックバッジ一覧
  List<Mission> get mission1 => [
        const Mission(
          missionId: 1,
          title: "クイズを10問解く",
          point: 10,
        ),
        const Mission(
          missionId: 2,
          title: "クイズを15問解く",
          point: 15,
        ),
        const Mission(
          missionId: 3,
          title: "クイズを20問解く",
          point: 20,
        ),
        const Mission(
          missionId: 4,
          title: "クイズを30問解く",
          point: 30,
        ),
      ];

  List<Mission> get mission2 => [
        const Mission(
          missionId: 5,
          title: "クイズに5問正解する",
          point: 5,
        ),
        const Mission(
          missionId: 6,
          title: "クイズに10問正解する",
          point: 10,
        ),
        const Mission(
          missionId: 7,
          title: "クイズに15問正解する",
          point: 15,
        ),
        const Mission(
          missionId: 8,
          title: "クイズに20問正解する",
          point: 20,
        ),
      ];

  List<Mission> get mission3 => [
        const Mission(
          missionId: 9,
          title: "今日のクイズに挑戦する",
          point: 15,
        ),
        const Mission(
          missionId: 10,
          title: "クイズに全正解する",
          point: 15,
        ),
        const Mission(
          missionId: 11,
          title: "力だめしに挑戦する",
          point: 15,
        ),
        const Mission(
          missionId: 12,
          title: "苦手克服に挑戦する",
          point: 15,
        ),
      ];
}
