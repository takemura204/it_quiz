import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../resource/dashboard_rank/rank_data.dart';
import 'dashboard_rank_state.dart';

final dashboardRankProvider =
    StateNotifierProvider<DashboardRankController, DashboardRankState>(
  (ref) => DashboardRankController(ref: ref),
);

class DashboardRankController extends StateNotifier<DashboardRankState>
    with LocatorMixin {
  DashboardRankController({required this.ref}) : super(DashboardRankState()) {
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
        final rankData = RankData.fromJson(json.decode(rankDataJson));
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

  ///称号一覧
  final rankDataList = [
    // 学習者の冒険者 (20×10)
    const RankData(
      rankId: 0,
      rankName: "学習の冒険者",
      rankLevel: 0,
      score: 0,
      levelUpScore: 20,
    ),
    // 知識の騎士 (30×10)
    const RankData(
      rankId: 1,
      rankName: "知識の騎士",
      rankLevel: 10,
      score: 200,
      levelUpScore: 30,
    ),
    // 書籍の戦士 (40×10)
    const RankData(
      rankId: 2,
      rankName: "書籍の戦士",
      rankLevel: 20,
      score: 500,
      levelUpScore: 40,
    ),
    // 学問の術士 (50×10)
    const RankData(
      rankId: 3,
      rankName: "学問の術士",
      rankLevel: 30,
      score: 900,
      levelUpScore: 50,
    ),
    // 知恵の魔法使い (60×10)
    const RankData(
      rankId: 4,
      rankName: "知恵の魔法使い",
      rankLevel: 40,
      score: 1400,
      levelUpScore: 60,
    ),
    // 知識の聖者 (70×10)
    const RankData(
      rankId: 5,
      rankName: "知識の聖者",
      rankLevel: 50,
      score: 2000,
      levelUpScore: 70,
    ),
    // 書物の大賢者 (80×10)
    const RankData(
        rankId: 6,
        rankName: "書物の大賢者",
        rankLevel: 60,
        score: 2700,
        levelUpScore: 80),
    // 学習の英雄 (90×10)
    const RankData(
      rankId: 7,
      rankName: "学習の英雄",
      rankLevel: 70,
      score: 3500,
      levelUpScore: 90,
    ),
    // 知識の王 (100×10)
    const RankData(
      rankId: 8,
      rankName: "知識の王",
      rankLevel: 80,
      score: 4300,
      levelUpScore: 100,
    ),
    // 学問のレジェンド (110×10)
    const RankData(
      rankId: 9,
      rankName: "学習の神",
      rankLevel: 90,
      score: 5300,
      levelUpScore: 110,
    ),
    const RankData(
      rankId: 10,
      rankName: "学問の伝説",
      rankLevel: 100,
      score: 5300,
      levelUpScore: 110,
    ),
  ];
}
