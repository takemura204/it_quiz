import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'mission.dart';
import 'missions.dart';

part 'missions_resorce.dart';

final missionModelProvider =
    StateNotifierProvider<MissionModel, Missions>((ref) => MissionModel(ref));

class MissionModel extends StateNotifier<Missions> {
  MissionModel(this.ref) : super(Missions()) {
    () async {
      await initState();
    }();
  }

  final Ref ref;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  CollectionReference<Mission> get _missionsRef => FirebaseFirestore.instance
      .collection('score')
      .doc(_auth.currentUser?.uid)
      .collection('missions')
      .withConverter(
        fromFirestore: (snapshot, _) => Mission.fromDocumentSnapshot(snapshot),
        toFirestore: (Mission mission, _) =>
            mission.toJsonWithoutUnnecessaryFields(),
      );

  Future initState() async {
    _loadMissions();
  }

  Future _loadMissions() async {
    try {
      final user = _auth.currentUser;
      final uid = user?.uid;
      final loadedMissions = [
        defaultMission1,
        defaultMission2,
        defaultMission3,
        randomMission1[state.mission1Index],
        randomMission2[state.mission2Index],
      ];

      if (uid != null) {
        final List<Mission> finalMissions = [];
        for (final mission in loadedMissions) {
          final docRef = _firestore
              .collection('score')
              .doc(uid)
              .collection('missions')
              .doc(mission.docId.toString());

          final doc = await docRef.get();
          final today = DateTime.now();

          // Firestoreのデータが存在する場合
          if (doc.exists) {
            final fetchedMission = Mission.fromDocumentSnapshot(doc);
            final createdAt = fetchedMission.createdAt;
            if (createdAt?.day == today.day &&
                createdAt?.month == today.month &&
                createdAt?.year == today.year) {
              finalMissions.add(fetchedMission);
            }
            // Firestoreから取得したcreatedAtが今日の日付と同じ場合
            else {
              final updatedMission = mission.copyWith(
                isReceived: fetchedMission.isReceived,
                createdAt: today,
              );
              await docRef.set(updatedMission.toJsonWithoutUnnecessaryFields(),
                  SetOptions(merge: true));
              finalMissions.add(updatedMission);
            }
          }
          // Firestoreのデータが存在しない場合
          else {
            final newMission = mission.copyWith(createdAt: today);
            await docRef.set(newMission.toJsonWithoutUnnecessaryFields());
            finalMissions.add(newMission);
          }
        }
        state = state.copyWith(missions: finalMissions);
        print({"Succeess：_loadMissions", state.missions.last.createdAt});
      }
    } catch (e, s) {
      print({e, s});
      print("Error：_loadMissions");
    }
  }

  Future updateMission(Mission mission) async {
    final updatedMissions = state.missions.map((updateMission) {
      if (updateMission.missionId == mission.missionId) {
        return mission.copyWith(isReceived: true);
      }
      return updateMission;
    }).toList();

    state = state.copyWith(missions: updatedMissions);
    print(state.missions);
  }

  Future shuffleMission1Index() async {
    final missions = randomMission1;
    final currentMission1Index = state.mission1Index;
    final otherMissions = List.from(missions);
    otherMissions.removeAt(currentMission1Index);
    final randomIndex = Random().nextInt(otherMissions.length);
    final newMission1Index = missions.indexOf(otherMissions[randomIndex]);
    state = state.copyWith(mission1Index: newMission1Index);
    _loadMissions();
  }

  Future shuffleMission2Index() async {
    final missions = randomMission2;
    final currentMission2Index = state.mission2Index;
    final otherMissions = List.from(missions);
    otherMissions.removeAt(currentMission2Index);
    final randomIndex = Random().nextInt(otherMissions.length);
    final newMission2Index = missions.indexOf(otherMissions[randomIndex]);
    state = state.copyWith(mission2Index: newMission2Index);
    _loadMissions();
  }
}
