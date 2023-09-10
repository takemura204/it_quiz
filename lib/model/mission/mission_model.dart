import 'dart:convert';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import 'mission.dart';
import 'missions.dart';

part 'missions_resorce.dart';

final missionModelProvider =
    StateNotifierProvider<MissionModel, Missions>((ref) => MissionModel(ref));

class MissionModel extends StateNotifier<Missions> with LocatorMixin {
  MissionModel(this.ref) : super(Missions()) {
    initState();
  }

  final Ref ref;

  //初期ミッション
  List<Mission> get defaultMissions => [
        defaultMission1,
        defaultMission2,
        defaultMission3,
        randomMission1[state.mission1Index],
        randomMission2[state.mission2Index],
      ];

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Future initState() async {
    // _resetData();
    state = state.copyWith(isLoading: true);
    await _loadMissions();
    state = state.copyWith(isLoading: false);
  }

  Future _loadMissions() async {
    try {
      final getMissions = await _getMissions();
      final updatedMissions = _updateMissions(getMissions);
      state = state.copyWith(missions: updatedMissions);
      _saveMissions(updatedMissions);
      print(updatedMissions[0].exp);
    } catch (e, s) {
      print({'Error:_loadMissions', e, s});
    }
  }

  Future<List<Mission>> _getMissions() async {
    final prefs = await SharedPreferences.getInstance();
    final missionsJsonList = prefs.getStringList('missions');
    if (missionsJsonList != null && missionsJsonList.isNotEmpty) {
      return missionsJsonList
          .map((missionJson) => Mission.fromJson(jsonDecode(missionJson)))
          .toList();
    } else {
      return defaultMissions;
    }
  }

  List<Mission> _updateMissions(List<Mission> missions) {
    return missions.map((mission) {
      // updatedAtが今日の日付でない場合、更新する
      if (mission.updatedAt == null ||
          !_isSameDay(mission.updatedAt!, DateTime.now())) {
        // defaultMissionsから対応するmissionを取得
        final matchMission = defaultMissions.firstWhere(
            (defaultMission) => defaultMission.missionId == mission.missionId,
            orElse: () => defaultMission1 // ここはエラー処理またはフォールバックの処理が必要
            );
        return Mission(
          docId: mission.docId,
          missionId: mission.missionId,
          title: matchMission.title,
          exp: matchMission.exp,
          isReceived: matchMission.isReceived,
          updatedAt: DateTime.now(),
        );
      }
      return mission; // 今日の日付の場合、そのままのデータを返す
    }).toList();
  }

  void updateReceiveMission(Mission mission) {
    final missionId = mission.missionId;
    final updatedMissions = state.missions.map((mission) {
      if (mission.missionId == missionId) {
        return mission.copyWith(isReceived: false); // isReceivedをfalseに更新
      }
      return mission;
    }).toList();
    state = state.copyWith(missions: updatedMissions);
    _saveMissions(updatedMissions); // missionsを端末に保存
  }

  Future _saveMissions(List<Mission> missions) async {
    final prefs = await SharedPreferences.getInstance();
    final missionList =
        missions.map((mission) => jsonEncode(mission.toJson())).toList();
    prefs.setStringList('missions', missionList);
  }

  void shuffleMissionIndex(int quizIndex) {
    assert(quizIndex == 3 || quizIndex == 4, 'Invalid quizIndex provided');
    final sourceMissions = (quizIndex == 3) ? randomMission1 : randomMission2;
    final random = Random();
    final int newMissionIndex = random.nextInt(sourceMissions.length);

    final newMission = sourceMissions[newMissionIndex];
    final updatedMissions = List<Mission>.from(state.missions);
    updatedMissions[quizIndex] = newMission;

    state = state.copyWith(missions: updatedMissions);
    _saveMissions(updatedMissions);
  }

  /// 現在のstateをリセット
  Future _resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("missions");
  }
}
