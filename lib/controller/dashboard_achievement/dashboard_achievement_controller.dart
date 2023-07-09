import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../resource/rank/rank.dart';
import 'dashboard_achievement_state.dart';

part 'dashboard_achievement_resorce.dart';

final dashboardAchievementProvider = StateNotifierProvider<
    DashboardAchievementController, DashboardAchievementState>(
  (ref) => DashboardAchievementController(ref: ref),
);

class DashboardAchievementController
    extends StateNotifier<DashboardAchievementState> with LocatorMixin {
  DashboardAchievementController({required this.ref})
      : super(DashboardAchievementState()) {
    initState();
  }

  final Ref ref;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _resetData();
    state = state.copyWith(isLoading: true);
    _loadDashboardRankData().then((_) {
      state = state.copyWith(isLoading: false);
    });
    super.initState();
  }

  ///データ読み込み
  Future _loadDashboardRankData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final rankDataJson = prefs.getString('rankData');

      //端末に保存されている時
      if (rankDataJson != null && rankDataJson.isNotEmpty) {
        final user = _auth.currentUser;
        final uid = user?.uid;
        final rankData = Rank.fromJson(json.decode(rankDataJson));
        //アカウント登録している時
        if (uid != null) {
          final docSnap = await _firestore.collection('score').doc(uid).get();
          if (docSnap.exists) {
            final data = docSnap.data();
            //Firestoreから参照
            state = state.copyWith(
              rankData: rankData.copyWith(
                rankId: data?['rankId'],
                rankName: data?['rankName'],
                rankLevel: data?['rankLevel'],
                levelUpScore: data?['levelUpScore'],
                score: data?['score'],
              ),
            );
          } else {
            state = state.copyWith(rankData: rankData);
          }
        }
        //ゲストユーザーの場合
        else {
          state = state.copyWith(rankData: rankData);
        }
      }
      //初回起動時
      else {
        state = state.copyWith(rankData: rankDataList[0]);
      }
      await _saveFirestore();
      await _saveDevice();
    } catch (e, s) {
      print("Error：loadDashboardRankData");
      print({e, s});
    }
  }

  ///ポイント更新
  Future updateScore(int addScore) async {
    try {
      final rankData = state.rankData;

      final updateScore = rankData!.score + addScore;
      final nextLevelScore = rankData.levelUpScore *
          ((rankData.rankLevel + 1) - rankDataList[rankData.rankId].rankLevel);
      final totalScore = updateScore + rankDataList[rankData.rankId].score;

      // レベルアップ && ランクアップ
      if (totalScore >= rankDataList[rankData.rankId + 1].score &&
          rankData.rankLevel >=
              rankDataList[rankData.rankId + 1].rankLevel - 1) {
        final differenceScore =
            totalScore - rankDataList[rankData.rankId + 1].score;
        print("A");

        state = state.copyWith(
            rankData: rankData.copyWith(
          rankId: rankDataList[rankData.rankId + 1].rankId,
          rankName: rankDataList[rankData.rankId + 1].rankName,
          rankLevel: rankData.rankLevel + 1,
          levelUpScore: rankDataList[rankData.rankId + 1].levelUpScore,
          score: differenceScore,
        ));
      }
      // レベルアップ
      else if (updateScore >= nextLevelScore &&
          rankData.rankLevel <
              rankDataList[rankData.rankId + 1].rankLevel - 1) {
        print("B");

        state = state.copyWith(
            rankData: rankData.copyWith(
          rankId: rankData.rankId,
          rankName: rankData.rankName,
          rankLevel: rankData.rankLevel + 1,
          levelUpScore: rankData.levelUpScore,
          score: updateScore,
        ));
      }
      //ポイント加算
      else {
        print("C");

        state = state.copyWith(
            rankData: rankData.copyWith(
          rankId: rankData.rankId,
          rankName: rankData.rankName,
          rankLevel: rankData.rankLevel,
          levelUpScore: rankData.levelUpScore,
          score: updateScore,
        ));
      }
      print({"totalScore", totalScore});
      print({"updateScore", updateScore});
      print({"nextLevelScore", nextLevelScore});
      await _saveFirestore();
      await _saveDevice();
    } catch (e, s) {
      print({e, s});
      print("Error：_updateScore");
    }
  }

  /// Firestoreに保存
  Future _saveFirestore() async {
    try {
      final user = _auth.currentUser;
      final uid = user?.uid;
      final users = FirebaseFirestore.instance.collection('score');
      final docRef = users.doc(uid);
      final rankData = state.rankData;
      await docRef.set({
        'uid': uid,
        'rankId': rankData?.rankId,
        'rankName': rankData?.rankName,
        'rankLevel': rankData?.rankLevel,
        'levelUpScore': rankData?.levelUpScore,
        'score': rankData?.score,
        'updateAt': DateTime.now(),
      }, SetOptions(merge: true));
      // print({"_saveFirestore", state.rankData});
      return state;
    } catch (e, s) {
      print("saveFirestore　Error");
      print({e, s});
    }
  }

  /// 端末に保存
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('rankData', json.encode(state.rankData!.toJson()));
  }

  /// 現在のstateをリセット
  Future _resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("rankData");
  }
}
